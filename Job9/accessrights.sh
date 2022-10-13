# command line to add in crontab -e to exec the script every time the .csv file is modified
# if find /Users/dondada/Desktop/LP/works/shell_exe/Job9 -mmin -1 -type f -print > ffub && grep Shell_Userlist.csv ffub; then sh /Users/dondada/Desktop/LP/works/shell_exe/Job9/accessrights.sh && rm ffub; fi

i=2
nb=`wc Shell_Userlist.csv > a && awk '{print $1}' FS=" " a && rm a`
nb=`expr $nb + 1`

while [ $i -lt $nb ]
do
	sed -n "$i p" Shell_Userlist.csv > buff
	id=`awk '{print $1}' FS="," buff`
	fin=`awk '{print $2}' FS="," buff`
	lan=`awk '{print $3}' FS="," buff`
  	psw=`awk '{print $4}' FS="," buff`
  	rgt=`awk '{print $5}' FS="," buff`
	dscl / -create /Users/$usr
	dscl / -create /Users/$usr RealName "$fin $lan"
	dscl / -create /Users/$usr UniqueID $id
	dscl / -passwd /Users/$usr $psw
	if [[ "$rgt" == *"Admin"* ]]
		then
			i=`expr $i + 1`
	else
		dscl / -append /Groups/admin GroupMembership $usr
		i=`expr $i + 1`
	fi
	rm buff
done
