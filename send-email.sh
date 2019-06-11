#! /bin/bash
# Programming and idea by : E2MA3N [Iman Homayouni]
# Gitbub : https://github.com/e2ma3n
# Email : e2ma3n@Gmail.com
# send-email v1.0 - core file
# Last update : 12-June-2019_02:42:19
# Usage 1 : send-email "text-message" "title" "to-mail@gmail.com"
# Usage 2 : send-email "/root/file.txt" "title" "to-mail@gmail.com"
# ------------------------------------------------------------------- #


# comment : usage function
function usage {
    echo 'Usage 1 : send-email "text-message" "title" "to-mail@gmail.com"'
    echo 'Usage 2 : send-email "/root/file.txt" "title" "to-mail@gmail.com"'
}


# comment : config file path
config_file='/opt/send-email/send-email.conf'


# comment : check config file
if [ ! -f "$config_file" ] ; then
    echo -e "\e[91m[!] error. /opt/send-email/send-email.conf not found. exit.\e[0m"
    exit 1
fi


# comment : check heirloom-mailx
if [ -z `which heirloom-mailx 2> /dev/null` ] ; then
    echo -e "\e[91m[!] error. heirloom-mailx not found. exit.\e[0m"
    exit 1
fi


# comment : check Variables
[ -z "$1" ] && echo -e "\e[91m[!] error. Insert text message or file. exit.\e[0m" && usage && exit 1
[ -z "$2" ] && echo -e "\e[91m[!] error. Insert title. exit.\e[0m" && usage && exit 1
[ -z "$3" ] && echo -e "\e[91m[!] error. Insert destination email address. exit.\e[0m" && usage && exit 1


# comment : read data from config file
smtp_srv=$(head -n 10 "$config_file" | tail -n 1 | cut -d = -f 2)
smtp_user=$(head -n 11 "$config_file" | tail -n 1 | cut -d = -f 2)
smtp_pass=$(head -n 12 "$config_file" | tail -n 1 | cut -d = -f 2)


# comment : read data from argument
send_to=$(echo "$3")
title=$(echo "$2")


# comment : main function
if [ -f "$1" &> /dev/null ] ; then
    time=`date +'%e %b %Y - %H:%M:%S'`
    sed "1 i\\$time\nMassege:" "$1" > /tmp/send-mail.txt
    cat /tmp/send-mail.txt | heirloom-mailx -v -r "$smtp_user" -s "$title" -S smtp=$smtp_srv -S smtp-use-starttls -S smtp-auth=login -S smtp-auth-user=$smtp_user -S smtp-auth-password=$smtp_pass -S ssl-verify=ignore -S nss-config-dir=/etc/pki/nssdb/ $send_to
    rm -rf /tmp/send-mail.txt &> /dev/null
    exit 0
else
    text_message=$(echo "$1")
    time=`date +'%e %b %Y - %H:%M:%S'`
    text_message=`echo "Date and time: $time" ; echo "Massege: $text_message"`
    echo "$text_message" | heirloom-mailx -v -r "$smtp_user" -s "$title" -S smtp=$smtp_srv -S smtp-use-starttls -S smtp-auth=login -S smtp-auth-user=$smtp_user -S smtp-auth-password=$smtp_pass -S ssl-verify=ignore -S nss-config-dir=/etc/pki/nssdb/ $send_to
    exit 0
fi
