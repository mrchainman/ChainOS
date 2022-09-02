#!/bin/bash
# Setup stuff
function check () {
	mbsync -c $HOME/.config/isync/mbsyncrc $@
}
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$(id -u)/bus
source $HOME/.config/bash/bash_exports
syncstate=$HOME/.config/mutt/syncstate
# Define notification funktion
notify() {
	export DISPLAY=:0
	notify-send -t 60000 --app-name="mutt-wizard" "📬 New mail!" "Folder: $1"
	# echo "📬 New mail!" "Folder: $1" > /dev/pts/0
	}
# List of mailboxes to sync
boxes=( "INBOX" "Teamwork" "Noc" "zabbix" "PMMCLI" "VerteilerAlle")
for i in "${boxes[@]}"
do
	check david.cimadom@zone35.de:"$i"
	if [ $(/bin/ls ~/.local/share/mail/david.cimadom@zone35.de/$i/new/ | wc -l) -gt 0 ]
	then
		if [ $(find ~/.local/share/mail/david.cimadom@zone35.de/$i/new/ -type f -newer $syncstate | wc -l) -gt 0 ]
		then
		notify "$i"
		fi
	fi
done

check -H david.cimadom@zone35.de:Kunden
check -H david.cimadom@zone35.de:Kollegen
touch "$syncstate"
