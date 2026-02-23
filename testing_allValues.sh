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

fancy_dot (){
	sleep 0.7;
	echo -n ".";
	sleep 0.7;
	echo -n ".";
	sleep 0.7;
	echo "."
}

echo "[!] Started unit test for change_brightness.sh [!]"
echo "[!] if you cant see nothing in the screen [!]"
echo "[!] DONT INTERRUPT THE TEST [!]"
echo "[*] Everthing will be fine in the end [*]"
fancy_dot 

test_func () {
	for i in {0..99}; do
		./change_brightness.sh -b $i
		sleep 0.01
	done
	for i in {0..999..100}; do
		./change_brightness.sh -b $i
		sleep 0.01
	done
}

test_func 
./change_brightness.sh -h

