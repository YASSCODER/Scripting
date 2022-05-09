#!/bin/bash
source "secure.sh"

show_usage #how to use the script 



while getopts "hcablgm" option
do
    case $option in

h)

help #help function from secure.sh

;;

c)

connexion #connexion function from secure.sh

;;

a)
 
alert #alert function from secure.sh

;;

l)

mailLogServices #mailLogServices function from secure.sh

;;

b)

boot #boot function from secure.sh

;;

g)

g=${OPTARG}
graphic $2 #graphic function from secure.sh

;;

m)

menu #menu function from secure.sh

;;

esac

done

exit 0