#!/bin/bash
source "functions.sh"

show_usage

while getopts "hca" option
do
    echo "getopts a trouvé l'option $option"
    case $option in

h)

help

;;

c)

connexion

;;

a)

alert

;;
l)


esac

done

echo "you need to put an option to run the script !"

exit 0
