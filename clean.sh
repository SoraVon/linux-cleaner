# simple linux clean code  by iSoraKa_#3301
clear

Logo() {
	echo "
	 ██████╗██╗     ███████╗ █████╗ ███╗   ██╗███████╗██████╗
	██╔════╝██║     ██╔════╝██╔══██╗████╗  ██║██╔════╝██╔══██╗
	██║     ██║     █████╗  ███████║██╔██╗ ██║█████╗  ██████╔╝
	██║     ██║     ██╔══╝  ██╔══██║██║╚██╗██║██╔══╝  ██╔══██╗
	╚██████╗███████╗███████╗██║  ██║██║ ╚████║███████╗██║  ██║
	 ╚═════╝╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝
	"
}
##
Full_clean() {
	clear
	echo "Warning..."
	echo "Full_clean will reset shortcuts, favorite apps list and remove all input languages"
	echo "are you sure you want to continue ? [y/n]"
	read f
	f=${f^^}
	if [[ $f == 'N' || $f == "NO" ]]; then
		exit
	fi
	clear
	sleep 0.5
	Logo
	echo "FULL CLEAN"
	sleep 0.9
	sudo dpkg --configure -a
	sudo apt-get update
	sudo apt-get -f install
	sudo apt-get full-upgrade
	sudo apt-get install --reinstall ubuntu-desktop
	sudo rm -rf /var/log/journal/*
	sudo apt-get autoremove
	sudo apt-get clean
	dconf reset -f /
	history -C
	Logs(){
		du -hs /var/log/journal/
		sudo du -sh ~/.cache/thumbnails
		return 0
}
	echo "Cleaning"
	echo $Log
	sleep 1.1
	journalctl --vacuum-time=10d
	sudo rm -rf /var/log/journal/*
	sudo rm -rf ~/.cache/thumbnails/*
	echo ""
	echo " Clean Completed "
	echo ""
	sleep 1.3
	clear
	echo " please reboot system by typing : "
	echo " sudo reboot"
	sleep 2

}

##
Quick_clean(){
	clear
	Logo
	echo "QUICK CLEAN"
	sleep 0.9
	sudo apt autoremove
	sudo dpkg --configure -a
        sudo rm -rf /var/log/journal/*
        sudo apt-get autoremove
        sudo apt-get clean
	history -C
}

##

clear
Logo
echo "Do you want to do quick clean ? [y/n]"
read f
f=${f^^}
if [[ $f == 'Y' || $f == 'YES' ]]; then
	Quick_clean

else
	clear
	Logo
	echo " Do you want to do full clean ? [y/n] "
	read f
	f=${f^^}
	if [[ $f == 'Y' || $f == 'YES' ]]; then
		Full_clean
	fi
fi

clear
sleep 0.7
Logo
echo "see you later..."
