#!/bin/bash
printf "Please choose the username for the live environment:\n"
read username
printf "Please choose the hostname for the live environment:\n"
read hostname
printf "Please choose the password for the live environment:\n"
read pass

passhash=$(openssl passwd -6 $pass)
cp airootfs/etc/passwd airootfs/etc/passwd.bak
cat > airootfs/etc/passwd << EOF
root:x:0:0:root:/root:/bin/bash
$username:x:1000:1000:$username:/home/$username:/bin/bash
EOF
# Specify groups
cp airootfs/etc/group airootfs/etc/group.bak
cat > airootfs/etc/group << EOF
root:x:0:root
$username:x:1000:$username
wheel:x:998:$username
EOF
# SEt password for username and root to username
cp airootfs/etc/shadow airootfs/etc/shadow.bak
cat > airootfs/etc/shadow << EOF
root:$passhash:14871::::::
$username:$passhash:19146:0:99999:7:::
EOF
# Set hostname
cp airootfs/etc/hostname airootfs/etc/hostname.bak
cat > airootfs/etc/hostname << EOF
$hostname
EOF
echo $username > airootfs/etc/env
printf "Done, delete backupfiles? (y/n)\n"
read del
if [ $del = y ]
then
	rm airootfs/etc/*.bak
else
	exit 0
fi
