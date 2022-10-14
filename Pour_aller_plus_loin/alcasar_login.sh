url="https://alcasar.laplateforme.io/intercept.php"

challenge=`curl -X GET $url -L | grep "challenge" | awk '{print $4}' | awk '{print $2}' FS='"'`

curl -X POST $url -H 'Content-Type: multipart/form-data' -F "challenge=$challenge" -F "userurl=http://www.euronews.com/" -F "username=$1" -F "password=$2" -F "button=Authentication" -L

echo $challenge
