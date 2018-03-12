#!/bin/bash
source $(dirname $0)/osshandle.setting
### RUN this script every 5 minutes
#
### configure block
## connection info. - provided by LilithGames
#TARGETADDR="CHANGE_ME"  #example: hogehoge@10.0.0.1::hogehoge/$HOSTNAME/
## path of the password file. - password provided by LilithGames
#PASSWDFILE="CHANGE_ME"  #example: ~/.rsync.passwd
## path of the source directory
#SOURCE_DIR="CHANGE_ME"  #example: /data/logs/ 
## path of the rsync log
#LOG_FILE="CHANGE_ME"    #example: /tmp/hogehoge/rsync.log
IDX=0
## functions block
function classify()
{
  let IDX=IDX+1
  file=$1
  basedir=$2
  for tag in `cat $file | awk '{print $1}' | sort -u`
  do
    newtag=`echo $tag | sed -e "s/\[//" -e "s/\]//"`
    #echo $newtag
    grep "^$newtag\b" $file > $basedir/rsync_src/$newtag.$HOSTNAME.n.`date -u "+%Y%m%d%H%M%S.$IDX"`
  done
}

function archive()
{
  backupdir=$1
  echo ">>>>>>>>>> archieve backup files $backupdir .. "
  cd $backupdir
  prefix=$HOSTNAME
  for i in {1..60}
  do
    suffix=`date -d"$i days ago" +%Y%m%d`
    count=`find . -type f -daystart -mtime $i | grep -v "\.tgz" | wc -l`
    if [ $count -eq 0 ]
    then
        continue
    else
        find . -type f -daystart -mtime $i | grep -v "\.tgz" | xargs tar -cvzf ${prefix}_${suffix}.tgz
    fi
  done
  find . -type f -daystart -mtime +1 | grep -v "\.tgz" | xargs -i rm {}
}

function sync_data()
{
  basedir=$1
  echo ">>>>>>>>>>>> handle $basedir ..."
  cd $basedir
  if [ ! -d rsync_src ]; then
    mkdir rsync_src
  fi
  if [ ! -d backup ]; then
      mkdir backup
  fi
 
  # classify
  for file in `ls *_log_*.log`
  do
    echo ">>> proc log file" $file
    classify $file $basedir
    rm $file
  done

  # sync
  rsync -vrz --timeout=30 --ignore-existing --blocking-io --password-file=$PASSWDFILE --port=8873 $basedir/rsync_src/ $TARGETADDR/
  rsync_rslt=$?
  # backup old files
  if [ $rsync_rslt -ne 0 ]; then
    echo "sync error $rsync_rslt at `date`" >>  $LOG_FILE
    return 
  else
    find rsync_src/ -type f -mmin +30 | xargs -i mv {} backup/
    # archive backup files
    # archive ${basedir}/backup
  fi
  for name in `find ${basedir}/backup/ -type f -ctime +5 -print`
  do
    rm -f ${name}
  done
}
## main
sync_data "$SOURCE_DIR"
