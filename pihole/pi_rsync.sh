#!/usr/bin/env bash
# PiHole Sync - Sync PiHoles from Primary to Secondary

# What files to RSYNC
SYNCFILES=(custom.list list.* pihole-FTL.conf)

# The Secondary PiHole Host
HOSTLIST=(pihole0.local reterm.local)

# Username on Secondary HOST
USER="home"

# Update interval for CRONJOB in minutes
CRONTIME="300"
CRONTEMP="/tmp/mycron"

# Print help
function print_help(){
	echo -e "\e[32mSyntax: $0 [-i] [-s]"
	echo -e "\e[32m\t[-i]\e[39m install: Set up Cronjob, only run once"
	echo -e "\e[32m\t[-s]\e[39m sync: Syncing the files"
	exit 1
}

# Set up Cronjob
function process_install(){
	# Make temporary cronfile
	echo -e "Adding \e[32mCRONJOB\e[39m to crontab..."
	crontab -l > "${CRONTEMP}"

	# Echo into file
	echo -e "*/${CRONTIME} * * * * /bin/bash /etc/pihole/pi_rsync.sh -s > /tmp/pi_rsync.sh.log" >> "${CRONTEMP}"

	# Install from the temporary cron file
	crontab "${CRONTEMP}"

	# Clean it up
	rm -f "${CRONTEMP}"
}

# Syncing the files
function process_sync(){
	# Stop the pihole service 
	for HOST in "${HOSTLIST[@]}"
	do
		echo -e "Running command \e[96mservice pihole-FTL stop\e[39m on \e[32m{${HOST}}\e[39m"
		ssh -i /home/home/.ssh/id_rsa -p 22 "${USER}"@"${HOST}" "sudo -S service pihole-FTL stop"
	done

	echo -e "Running command \e[96mservice pihole-FTL stop\e[39m on \e[32m{$(hostname -s)}\e[39m"
	sudo service pihole-FTL stop

	# Loop trough files and RSYNC them to the Secondary Host
	for HOST in "${HOSTLIST[@]}"
	do
		for FILE in "${SYNCFILES[@]}"
		do
			echo -e "Syncing \e[32m{$FILE}\e[39m over to \e[32m{${HOST}}\e[39m..."
			rsync -vP --rsync-path="sudo rsync" '-e ssh -i ~home/.ssh/id_rsa -p 22' /etc/pihole/"${FILE}" "${USER}"@"${HOST}":/etc/pihole/		
		done

		# Do updates, and reload important systems
		echo -e "Running command \e[96mpkill pihole-FTL\e[39m on \e[32m{${HOST}}\e[39m"
		ssh -i /home/home/.ssh/id_rsa -p 22 "${USER}"@"${HOST}" "sudo -S pkill pihole-FTL"

		echo -e "Running command \e[96mservice pihole-FTL start\e[39m on \e[32m{${HOST}}\e[39m"
		ssh -i /home/home/.ssh/id_rsa -p 22 "${USER}"@"${HOST}" "sudo -S service pihole-FTL start"

		echo -e "Running command \e[96mpihole restartdns reload-lists\e[39m on \e[32m{${HOST}}\e[39m"
		ssh -i /home/home/.ssh/id_rsa -p 22 "${USER}"@"${HOST}" "sudo -S pihole restartdns reload-lists"

		echo -e "Running command \e[96mpihole updateGravity\e[39m on \e[32m{${HOST}}\e[39m"
		ssh -i /home/home/.ssh/id_rsa -p 22 "${USER}"@"${HOST}" "sudo -S pihole updateGravity"
	done

		echo -e "Running command \e[96mservice pihole-FTL start\e[39m on \e[32m{$(hostname -s)}\e[39m"
		sudo service pihole-FTL start
}

# Print help if no argument is supplied
if [[ $# -eq 0 ]]
then
	print_help
	exit 0
fi

# Catch arguments
while getopts ":is" o
do
	case "$o" in
	i) process_install ;;
	s) process_sync ;;  
	*)
	esac
done