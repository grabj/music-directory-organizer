#!/bin/bash

#funkcje
function StworzDir()
{
[[ ! -d "$1" ]] && mkdir "$1"
}

function PrzypiszTag()
{
tag=$(id3v2 -R "$Plik" | grep "$1" | awk -F": " '{ print $2 }')
echo "$tag"
}

#main
[[ $# -eq 0 ]] && { printf "Nie podano lokalizacji katalogu do zorganizowania\n"; exit 1; }
[[ ! -e $1 ]] && { printf "Nie znaleziono katalogu o podanej nazwie\n"; exit 2; }
[[ ! -d $1 ]] && { printf "Nalezy podac sciezke katalogu!\n"; exit 3; }
clear

Arg_dir="$1"
New_dir="$Arg_dir (nowy)"
mkdir "$New_dir"
mkdir "$New_dir/tmp"
echo -e "Utworzono katalog '$New_dir' do ktorego pliki zostana przeniesione.\n"

find "$Arg_dir" -iname "*.mp3" -exec mv {} "$New_dir/tmp" \;

for Plik in "$New_dir"/tmp/*.mp3
do
        tytul="$(PrzypiszTag "TIT2")"
	numer="$(PrzypiszTag "TRCK")"
	album="$(PrzypiszTag "TALB")"
	artysta="$(PrzypiszTag "TPE1")"
	rok="$(PrzypiszTag "TYER")"

		if [ -n "$numer" ] && [ -n "$tytul" ] && [ -n "$artysta" ] && [ -n "$album" ] && [ -n "$rok" ]
		then
			nazwa_pliku="$(printf "%02d" "$numer") - $tytul.mp3"
			nazwa_albumu="$album ($rok)"
			StworzDir "$New_dir/$artysta"
			StworzDir "$New_dir/$artysta/$nazwa_albumu"
			mv "$Plik" "$New_dir/$artysta/$nazwa_albumu/$nazwa_pliku"
		else
			StworzDir "$New_dir/unknown"
			mv "$Plik" "$New_dir/unknown"
			echo -e "Plik '$Plik' nie zostal rozpoznany...\nprzeniesiono do '$New_dir/unknown'\n"
		fi
done

rm -d "$New_dir"/tmp
rm --recursive "$Arg_dir"

echo "Zakonczono dzialanie skryptu."
exit 0;