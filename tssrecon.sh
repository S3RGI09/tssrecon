#!/bin/bash

echo " _____                              "  
echo "|_   _|__ ___ _ __ ___  ___ ___  _ __"  
echo "  | |/ __/ __| '__/ _ \/ __/ _ \| '_ \ "
echo "  | |\__ \__ \ | |  __/ (_| (_) | | | |"
echo "  |_||___/___/_|  \___|\___\___/|_| |_|"


if [ -z "$1" ]
then

        echo "Usage: ./tssrecon.sh <IP>"
        exit 1
fi
printf "\n---- NMAP ----\n\n" > resultados
echo "Arrancando Scan.py | Se a compilado el codigo para que funcione en bash"
nmap $1 | tail -n +5 | head -n -3 >> resultados
while read line
do
        if [[ $line == *open* ]] && [[ $line == *http* ]]
        then

        	    echo "Arrancando Gobuster... "
        	    gobuster dir -u $1 -w /usr/share/wordlists/dirb/common.txt -qz > temp1

        echo "Arrancando WhatWeb... "
        whatweb $1 -v > temp2
        fi
done < resultados

if [ -e temp1 ]
then
	    printf "\n---- DIRS ----\n\n" >> resultados
	    cat temp1 >> resultados
	    rm temp1
fi

if [ -e temp2 ]
then
	printf "\n---- WEB ----\n\n" >> resultados
	    cat temp2 >> resultados
	    rm temp2
fi
cat resultados
