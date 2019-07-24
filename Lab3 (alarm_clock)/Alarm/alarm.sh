#! /bin/bash

echo "Меню:";
echo "1.Создать будильник";
echo "2.Удалить будильник";
echo "3.Просмотреть будильники";
echo "4.Редактировать будильник";
echo "5.Выход из программы";

read choose;
PROGPATH1="/home/mikhail/AdminLinux/Alarm/music1.sh"
PROGPATH2="/home/mikhail/AdminLinux/Alarm/music2.sh"
PROGPATH3="/home/mikhail/AdminLinux/Alarm/music3.sh"



while [ $choose != "5" ]
do
	if [[ $choose == "1" ]]
		then
			echo "DISPLAY=:0 " >> alarms.txt
			d=''
			echo -n "В какой день вас разбудить? (гггг-мм-дд): "
			read d

			h=''
			echo -n "В какой час вас разбудить? (чч): "
			read h

			declare -i m=''
			echo -n "Во сколько минут вас разбудить? (мм): "
			read m

			echo "Введенные данные"
			echo "$d $h:$m"
			echo "$h:$m = $d" >> alarms_list.txt

			echo "Выберите пункт меню"
			echo "1. Rhytmbox"
			echo "2. Mpg123"
			echo "3. Mplayer"
			
			read player
			
			case $player in
			
				"1") player=$PROGPATH1;;
				"2") player=$PROGPATH2;;
				"3") player=$PROGPATH3;;
				* ) echo "Ошибка";
			esac
			
			echo "$m $h * * * $player" >> alarms.txt

			crontab < alarms.txt

			echo "Будильник готов"
	fi


	if [[ $choose == "2" ]]
	then
		echo "Введите будильник, который надо удалить:"
		h=''
		echo -n "Час пробуждения? (чч): "
		read h

		declare -i m=''
		echo -n "Минуты пробуждения? (мм): "
		read m

		String="$m $h * * * $player"

		echo "$String"

		sed '/test/d' myfile
	fi


	if [[ $choose == "3" ]]; then
		cat < alarms_list.txt
	fi

	if [[ $choose == "4" ]]
	then
		echo "Введите будильник, который надо отредактировать:"
		h=''
		echo -n "Час пробуждения? (чч): "
		read h

		declare -i m=''
		echo -n "Минуты пробуждения? (мм): "
		read m

		StringA="$m $h * * * $player"

		echo "AAA = $StringA"
		
		echo "Введите данные нового будильника заново: "

		echo -n "Час пробуждения? (чч): "
		read h

		declare -i m=''
		echo -n "Минуты пробуждения? (мм): "
		read m

		StringB="$m $h * * * $player"
		echo "BBB = $StringB"

		sed 's/${StringA}/${StringB}/g' alarms.txt | tee -a /home/mikhail/AdminLinux/Alarm/alarms.txt

		# sed -i 's/'$StringA'/'$StringB'/g' alarms.txt

		# crontab < alarms.txt


	fi

	echo "Выберите след. пункт меню";
	read choose;
done
