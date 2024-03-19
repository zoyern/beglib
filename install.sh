#!/bin/bash

source color.sh
clear

# Fonction pour l'action d'installation
install_repository() {
    case $1 in
        -simple)
            echo -e "$Green ->Cloning repository simple...$END"
            git clone https://github.com/zoyern/beglib_simple.git "$2"
            ;;
        -small)
            echo -e "$Green ->Cloning repository small...$END"
            git clone https://github.com/zoyern/beglib_small.git "$2"
            ;;
        -medium)
            echo -e "$Green ->Cloning repository medium...$END"
            git clone https://github.com/zoyern/beglib_medium.git "$2"
            ;;
        -big)
            echo -e "$Green ->Cloning repository big...$END"
            git clone https://github.com/zoyern/beglib_big.git "$2"
            ;;
        -minishell)
            echo -e "$Green ->Cloning repository minishell...$END"
            git clone https://github.com/zoyern/ft_minishell.git "$2"
            ;;
        *)
            echo "Argument inconnu pour l'installation: $1"
            ;;
    esac
}

delete_repository() {
	echo -e "$BRed ->Deleteting repository $1...$END"
	rm -rf $1
}

reset_repository() {
	delete_repository "$2"
    case $1 in
        -simple)
            git clone https://github.com/zoyern/beglib_simple.git "$2"
            ;;
        -small)
            echo -e "$Green ->Cloning repository small...$END"
            git clone https://github.com/zoyern/beglib_small.git "$2"
            ;;
        -medium)
            echo -e "$Green ->Cloning repository medium...$END"
            git clone https://github.com/zoyern/beglib_medium.git "$2"
            ;;
        -big)
            echo -e "$Green ->Cloning repository big...$END"
            git clone https://github.com/zoyern/beglib_big.git "$2"
            ;;
        -minishell)
            echo -e "$Green ->Cloning repository minishell...$END"
            git clone https://github.com/zoyern/ft_minishell.git "$2"
            ;;
        *)
            echo "Argument inconnu pour l'installation: $1"
            ;;
    esac
}

welcom() {
    echo -e "$White------------------------------"
    echo -e "$Cyan------------------------------"
    echo -e "$Blue------------------------------"
    echo -e "$Purple------------------------------"
    echo -e "$Yellow------------------------------"
    echo -e "$Black------------------------------"
    echo -e "$Red------------------------------"
    echo -e "$Green------------------------------"
}

# Vérifie si au moins un argument est passé
if [ $# -eq 0 ]; then
    welcom
    exit 1
fi

# Vérifie si le nombre d'arguments est pair (doit être un nombre pair dû à la structure de l'action + son argument)
if [ $# -eq 1 ]; then
    echo "Nombre d'arguments incorrect. Utilisation: $0 -action [-setings] ..."
    echo "$BRed [-help] if needed$END"
    exit 1
fi

# Boucle sur les arguments en sautant deux par deux pour traiter chaque paire action + argument
while [ "$1" != "" ]; do
    case $1 in
        -install)
            shift
            while [ "$1" != "" ]; do
                install_repository "$1" "$2"
                shift 2
            done
            ;;
        -delete)
            shift
            while [ "$1" != "" ]; do
                delete_repository "$1" 
                shift
            done
            ;;
        -reset)
           shift
            while [ "$1" != "" ]; do
                reset_repository "$1" "$2"
                shift 2
            done
            ;;
        *)
            echo "Action inconnue: $1"
            ;;
    esac
    shift
done
