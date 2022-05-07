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