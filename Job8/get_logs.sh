# line to add in "crontab -e" to execute the script every hours
# 00 * * * * sh /Users/dondada/Desktop/LP/works/shell_exe/Job8/get_logs.sh

Date=`date "+%d-%m-%y-%H:%M"`
last > buff
grep -v -E "(^#|^$' ')" buff | wc -l > nbl
tar -zcvf number_connection_$Date.tar.gz nbl
mv number_connection_*.tar.gz Backup
rm buff nbl
