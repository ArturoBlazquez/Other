file=/home/pi/lastip

urlmia=$( curl ipinfo.io/ip )
urlprev=$( cat $file )

if [ "$urlmia" != "$urlprev" ]
then
    echo $urlmia > $file
ssh arturobl.com@ssh.arturobl.com << EOF
    cd /www/
    sed -i 's/http:.*/http:\/\/'"${urlmia}"'/g' .htaccess
EOF
fi
