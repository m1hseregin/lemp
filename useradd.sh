PurpleColor='\033[0;35m'
RedColor='\033[0;31m'
CyanColor='\033[0;36m'
NoColor='\033[0m'

printf "${PurpleColor}This script add user and create user home folder${NoColor}\n"
printf "${PurpleColor}Script ask your domain, create home folder at ${RedColor}/jail${PurpleColor} folder, copy files at ${RedColor}/etc/skel${PurpleColor} to home folder, add user with flags ${RedColor}-U -s /bin/false${PurpleColor} and change owner on created folder to ${RedColor}user:user${NoColor}\n"

read -p "Enter domain: " domain
mkdir -p /jail/$domain
cp -rT /etc/skel /jail/$domain
mkdir -p /jail/$domain/www
mkdir -p /jail/$domain/tmp
mkdir -p /jail/$domain/logs

useradd -d /jail/$domain -U -s /bin/false $domain
chown -R $domain:$domain /jail/$domain

printf "${RedColor}****************\nDONT FORGET USE PASSWD FOR THIS USER!!!!!\n****************${NoColor}\n"