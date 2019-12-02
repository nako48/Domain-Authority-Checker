#!/bin/bash
# Github : nako48
# Code By : Scarlet Foc
RED='\033[0;31m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
ORANGE='\033[0;33m' 
PUR='\033[0;35m'
GRN="\e[32m"
WHI="\e[37m"
NC='\033[0m'
nakooooooo(){
	curl=$(curl -s "http://nako.best/moz.php?url=$1" -L)
	da=$(echo $curl | grep -Po '(?<=DA":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
	pa=$(echo $curl | grep -Po '(?<=PA":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
	rankg=$(echo $curl | grep -Po '(?<=Global Rank":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
	rankc=$(echo $curl | grep -Po '(?<=Global Rank":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
	result=$(echo $curl | grep -Po '(?<=result":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
	if [[ $curl =~ "200" ]]; then
		printf "${GRN}Berhasil => ${ORANGE}$1 ${YELLOW}| DA : $da ${YELLOW}| PA : $pa ${YELLOW}| RG : $rankg ${YELLOW}| RC : $rankc \n"
		echo "Berhasil => $1 | DA : $da | PA : $pa | RG : $rankg | RC : $rankc">>hasil.txt
	else
		printf "Gagal Check!\n"
	fi
}
echo -n "Masukan File List : "
read list
if [ ! -f $list ]; then
	echo "$list No Such File"
	exit
fi
x=$(gawk '{ print $1 }' $list)
IFS=$'\r\n' GLOBIGNORE='*' command eval  'site=($x)'
for (( i = 0; i < "${#site[@]}"; i++ )); do
	url="${site[$i]}"
	nakooooooo $url
done
