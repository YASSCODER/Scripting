#!/bin/bash
source "~/Desktop/projet5/secure.sh"
 

    while getopts ":hcablgm" option ;
        do
            if [ $# -ne 1 ]; then
 			    echo "Le nombre d'arguments est invalide";exit
		    fi
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

            *)

            show_usage  #how to use the script
            exit 0
            ;;

            esac

        done
            if [ $OPTIND -eq 1 ]; then
                show_usage #how to use the script
                    exit 1
            fi


exit 0
