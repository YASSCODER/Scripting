#!/bin/bash

#show ho to use the logs.sh file
function show_usage(){
	echo "logs.sh:[-h] [-m] [-g] [-c] [-l] [-a] [-b]"
}

#test function to test the arguments
function tester(){
	if [[ $1 -eq "-h" || $1 -eq "-m" ||  $1 -eq "-g" ||  $1 -eq "-c" || $1  -eq "-l" || $1 -eq "-a" || $1 -eq "-b" ]]
		then echo "good usage of logs.sh"
			return 1
		else 
			echo "error of usage of arguments for log.sh"
	fi
			
}
#help function & description 
function help(){
	echo "Description :"
	echo "==================================================================="
	echo " 	 1. analysé le systeme de connexion des users sur le Linux Kernel
	 2. exection de cette application consiste le super User (root)
	 -h => afficher le manuel d'utilisation de l'application
	 -c => tentaive de connexion
	 -a => alert
	 -l => envoyer une notification au users via un email
	 -b => starting name service
	 -g => afficher un menu graphic UI
	 -m => afficher un menu textuelle"
echo "==================================================================="
echo "for more details :"
	cat /home/yasscoder/Desktop/projet5/help.txt
}

#connexion function => access with success to the system : connexion !
function connexion(){
	
    grep "$1" /var/log/auth.log > log.backup
cat log.backup

}

#alert function => failur access to the system : connexion failed !
function alert(){
    
	sudo lastb -R > failur.log
	cat failur.log
}

#this functions gives the mail logs & error.logs 
#in this machine can't create a smtp connection with google.gmail.service that's why it's empty !

function mailLogServices(){
 tail -n /var/log/mail.log > mail.log
 tail -n /var/log/mail.err > mail.err

cat mail.log 
echo "================"
cat mail.err 
}

#boot services log

function boot(){ 
sudo cat /var/log/boot.log | grep "Starting"

}

#graphic interface 
function graphic(){
	yad    --text="logs interface;" \
            --center \
        --button=gtk-cancel:1 \
        --button="1-Display usage form ":2 \
        --button="2-Display help":3 \
        --button="3-Display connexion to the system":4 \
        --button="4-Display failur connexion in the system":5 \
        --button="5-Display mail logs":6 \
        --button="6-Display starting boot service":7 \
        --title "logs interface" \

		button=$?

			[[ $button -eq 1 ]] && exit 0

			if [[ $button -eq 2 ]]; then
			show_usage
			graphic

			elif [[ $button -eq 3 ]]; then
			echo "execution"
			help
			graphic

			elif [[ $button -eq 4 ]]; then
			connexion
			graphic

			elif [[ $button -eq 5 ]]; then
			alert
			graphic

			elif [[ $button -eq 6 ]]; then
			mailLogServices
			graphic		

			elif [[ $button -eq 7 ]]; then
			boot
			graphic
		fi
}			

#menu in terminal 
function menu(){
	choix
	while [ choix != "0" ] 
	do
	echo "<---------- Options you can use it to use the script ---------->"
	echo "                                                              ||"
	echo "1-diplay how to use the script                                ||"
	echo "2-display help                                                ||"
	echo "3-display connexion to the system                             ||"
	echo "4-display alert                                               ||"
	echo "5-display mail logs                                           ||"
	echo "6-display boot service                                        ||"
	echo "0-exit                                                        ||"
	echo "                                                              ||"
	echo "<-------------------------------------------------------------->"


	read choix

	case $choix in
	"1") show_usage 
		;;
	"2") help 
	;;
	"3") connexion 
	;;
	"4") alert 
	;;
	"5") mailLogServices 
	;;
	"6") boot 
	;;
	"0") exit 
	;;
	esac
	done

}