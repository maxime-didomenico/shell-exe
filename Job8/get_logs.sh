# line to add in "crontab -e" to execute the script every hours
# 00 * * * * sh /Users/dondada/Desktop/LP/works/shell_exe/Job8/get_logs.sh

Date=`date "+%d-%m-%y-%H:%M"`
last > buff
grep -v -E "(^#|^$' ')" buff | wc -l > nbc
tar -zcvf number_connection_$Date.tar.gz nbc
mv number_connection_$Date.tar.gz Backup
rm buff nbc
