#!/bin/bash

###################################################################
# function: Cut nginx log files by date and clean them regularly. #
###################################################################

# set the path to nginx log files
log_dir="/Users/xx/log/nginx"
# The format is as follows: 20200727
time=`date +%Y%m%d`
# set the path to nginx
nginx_bin="/usr/local/bin/nginx"
# set how long you want to save
save_days=7

#############################################
# Please do not modify the following script #
#############################################

# rename xxx.log xxx_{YYYYMMDD}.log
for logfile in `ls -l $log_dir |  grep -v "^d" | awk '{print $9}' | grep ".log$" | grep -v "[_-]\{1\}[0-9]\{8\}.log"` ;do
    mv $log_dir/$logfile $log_dir/${logfile%.*}_$time.log
done;

# delete 7 days ago nginx log files
find $log_dir -mtime +$save_days -exec rm -rf {} \; 

# reload nginx service
$nginx_bin -s reload
