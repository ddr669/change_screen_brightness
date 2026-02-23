#!/usr/bin/sh
##### Testing in kernel	 ######
####   Arch1.1  6.18.7	  #####
###	 github.com/ddr669/ -> ####
## change_brithness_screen	###
# -**- Author:__DDr669__ -**-##
##		date:__/__/__    	###
###						   ####
####				 	 ######
#####					#######

help_me () {
	echo
	echo -e -n "**\t**\tchange_brightness.sh\t-__DDr669__-\n"
	echo
	echo "a bash script to change screen brightness."
	echo -e -n "Use to to change screenbrightness. \n\n"
	echo -e -n "Parameters:\n"
	echo -e -n "\t-b Number - brightness * A number between 0-10.\n"
	echo -e -n "\t-h - help.\n"
	
}
simple_help () {	
	echo "[!] Option -b without arguments."
}
get_screen (){
	local screenL=$1
	echo $screenL	
}
new_b=0
com_ret=$(xrandr --query | grep '\bconnected\b')

_SCREEN=$(get_screen $com_ret)
echo "[*] Default monitor device: [$_SCREEN] [*]"
var=$1

if [ ${#var} -eq 0 ];
then
	help_me
	exit
fi
if [ ${#var} -gt 1 ];
then
	if [ $1 == '-h' ] || [ $1 == '--help' ];
	then
		help_me
		exit
	fi
fi
while getopts b: OPT
do
	case "${OPT}" in
		b)new_b="${OPTARG}"
			;;
		*)simple_help
			break
			;;
	esac
done
if [ $new_b -gt 11 ];
then
	if [ $new_b -lt 45 ];
	then
		new_b=$new_b
	fi
fi
if [ $new_b -lt 4 ] && [ $new_b != 0 ]; then
	tmp_val=$new_b
	echo -n "[!]|-The darkness is dangerous "
	echo "and replace your eyes by the void.-|[!]"
fi
case $new_b in
	10)new_b="1.0"
		echo "[*] Change brightness to $new_b [*]"
		xrandr --output $_SCREEN --brightness $new_b
		;;
	0)
		;;
	*)new_b="0.$new_b"
		echo "[*] Change brightness to $new_b [*]"
		xrandr --output $_SCREEN --brightness $new_b
		;;
esac

echo
