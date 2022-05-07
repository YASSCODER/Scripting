#!/bin/bash
source "secure.sh"

show_usage



while getopts "hcabl" option
do
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

mailLogServices

;;

b)

boot

;;

esac

done

exit 0