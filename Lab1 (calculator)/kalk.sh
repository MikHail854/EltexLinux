#!/bin/bash
clear;
echo "Выберите пункт меню:";
echo "1 - Введи данные";
echo "2 - Выбери доперацию";
echo "3 - Выполнить и выдать результат";
echo "4 - Выход";

read x;

while [ $x -lt 4 ]
do
	case $x in
		1)
			clear;
			echo "Введи данные";
			read ch1;
			read ch2;
			;;
		2)	
			clear;		
			echo "Выбери действие:";
			echo "1 - Сложение";
			echo "2 - Вычитание";
			echo "3 - Умножение";
			echo "4 - Деление";
			read d;
			;;
		3)
			clear;
			echo "Результат равен";
			case $d in
				1)
				echo $(( $ch1 + $ch2 ));
				;;
				2)
				echo $(( $ch1 - $ch2 ));
				;;
				3)
				echo $(( $ch1 * $ch2 ));
				;;
				4)
				echo $(( $ch1 / $ch2 ));
				;;
			esac
			;;			
	esac
echo "Выберите пункт меню:";
echo "1 - Введи данные";
echo "2 - Выбери доперацию";
echo "3 - Выполнить и выдать результат";
echo "4 - Выход";
read x;
done 
