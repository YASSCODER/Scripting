#!/bin/bash

#show ho to use the logs.sh file
function show_usage(){
	echo "logs.sh:[-h] [-m] [-g] [-c] [-l] [-a] [-b] chemin.."
}

#test function to test the arguments
function tester(){
	if [[ $1 == "-h" || $1 == "-m" ||  $1 == "-g" ||  $1 == "-c" || $1  == "-l" || $1 == "-a" || $1 == "-b" ]]
		then echo "1"
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
#in this machine can't create a smtp connection with google.gmail.service that's it's empty !

function mailLogServices(){
tail -n1 /var/log/mail.log > mail.log
tail -n1 /var/log/mail.err > mail.err
cat mail.log 
echo "================"
cat mail.err 
}

#boot services log

function boot(){ 
cat /var/log/boot.log | grep "Starting"

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

			[[ s$button -eq 1 ]] && exit 0

			if [[ s$button -eq 2 ]]; then
			show_usage
			graphic

			elif [[ s$button -eq 3 ]]; then
			echo "execution"
			help
			graphic

			elif [[ s$button -eq 4 ]]; then
			connexion
			graphic

			elif [[ s$button -eq 5 ]]; then
			alert
			graphic

			elif [[ s$button -eq 6 ]]; then
			mailLogServices
			graphic		

			elif [[ s$button -eq 7 ]]; then
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
	"1") show_usage $2
		;;
	"2") help $2
	;;
	"3")connexion $2
	;;
	"4") alert $2
	;;
	"5") mailLogServices $2
	;;
	"6") boot $2
	;;
	"0") exit 
	;;
	esac
	done

}