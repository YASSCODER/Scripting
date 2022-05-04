#!/bin/bash
function show_usage(){
	echo "logs.sh:[-h] [-m] [-g] [-c] [-l] [-a] [-b] chemin.."
}
function tester(){
	if [[ $1 == "-h" || $1 == "-m" ||  $1 == "-g" ||  $1 == "-c" || $1  == "-l" || $1 == "-a" || $1 == "-b" ]]
		then echo "1"
		else 
			echo "error of usage of arguments for log.sh"
	fi
			
}
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
}
function connexion(){
	
    last

}

function alert(){
    sudo lastb
}