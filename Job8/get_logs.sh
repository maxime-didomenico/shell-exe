# line to add in "crontab -e" to execute the script every hours
# 00 * * * * sh /Users/dondada/Desktop/LP/works/shell_exe/Job8/get_logs.sh

Date=`date "+%d-%m-%y-%H:%M"`
grep "TXkgZGlzY29yZCBEb25EYWRhIzM0MzE" /var/log/system.log  > buff
grep -v -E "(^#|^$' ')" buff | wc -l > nb_l-$Date
tar -zcvf number_connection_$Date.tar.gz nb_l-*
mv number_connection_*.tar.gz Backup
rm buff nb_l-*
