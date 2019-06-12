# send-mail

## Introduction
sending email using third party smtp servers in linux terminal


## What distributions are supported ?
All popular linux distributions such as debian and CentOS

| Distribution | Version |
| ---------- | ----------- |
| Debian     | debian-9.9.0-amd64-netinst |


## Dependencies

| Dependency | Description |
| ---------- | ----------- |
| which       | which returns the pathnames of the files (or links) which would be executed in the current environment, had its arguments been given as commands in a strictly POSIX-conformant shell. |
| head       | Print  the first 10 lines of each FILE to standard output. |
| rm         | rm removes each specified file. |
| cat        | Concatenate FILE(s) to standard output. |
| date       | Display the current time in the given FORMAT, or set the system date. |
| tail       | Print  the  last  10 lines of each FILE to standard output. |
| cut        | Print selected parts of lines from each FILE to standard output. |
| sed        | Sed  is  a  stream editor. |
| heirloom-mailx        | send and receive Internet mail |


## How to install ?
```
# su - root
# git clone https://github.com/e2ma3n/send-email
# mkdir /opt/send-email/
# mv send-email/send-email.sh /opt/send-email/
# mv send-email/send-email.conf /opt/send-email/
# chmod +x /opt/send-email/send-email.sh
# chmod 755 /opt/send-email/send-email.conf
# ln -s /opt/send-email/send-email.sh /usr/bin/send-email
```
open /opt/send-email/send-email.conf and insert your smtp data
