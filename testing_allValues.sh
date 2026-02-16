#!/usr/bin/bash
##### Testing in kernel	 ######
####   Arch1.1  6.18.7	  #####
###	 github.com/ddr669/ -> ####
## change_brithness_screen	###
# -**- Author:__DDr669__ -**-##
##		date:__/__/__    	###
###						   ####
####				 	 ######
#####					#######


echo "[!] Started unit test for change_brightness.sh [!]"
echo "[!] if you cant see nothing in the screen [!]"
echo "[!] DONT INTERRUPT THE TEST [!]"
echo "[*] Everthing will be fine in the end [*]"

sleep 0.7;echo -n ".";sleep 0.7; echo -n ".";sleep 0.7; echo "."

test_func () {
	for i in {0..999}; do
		./change_brightness.sh -b $i
		sleep 0.01
	done
}

test_func 
./change_brightness.sh -h

