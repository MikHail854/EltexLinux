#!/bin/bash

ip=$1;
IFS=. read -r i1 i2 i3 i4 <<< "$ip";
echo "Введите маску: ";
read mask;
if [[ $mask == *"."*  ]]
then
	IFS=. read -r m1 m2 m3 m4 <<< "$mask";
	echo "network:   $((i1 & m1)).$((i2 & m2)).$((i3 & m3)).$((i4 & m4))"
	echo "first IP:  $((i1 & m1)).$((i2 & m2)).$((i3 & m3)).$(((i4 & m4)+1))"
	echo "last IP:   $((i1 & m1 | 255-m1)).$((i2 & m2 | 255-m2)).$((i3 & m3 | 255-m3)).$(((i4 & m4 | 255-m4)-1))"
	echo "broadcast: $((i1 & m1 | 255-m1)).$((i2 & m2 | 255-m2)).$((i3 & m3 | 255-m3)).$((i4 & m4 | 255-m4))"
else

if [[ $mask == *"8"*  ]]
then
	m1=255; m2=0; m3=0; m4=0;
fi

if [[ $mask == *"16"*  ]]
then
	m1=255; m2=255; m3=0; m4=0; 
fi

if [[ $mask == *"24"*  ]]
then
m1=255; m2=255; m3=255; m4=0;
fi

if [[ $mask == *"32"*  ]]
then
	m1=255; m2=255; m3=255; m4=255;
fi

echo "network:   $((i1 & m1)).$((i2 & m2)).$((i3 & m3)).$((i4 & m4))"
echo "first IP:  $((i1 & m1)).$((i2 & m2)).$((i3 & m3)).$(((i4 & m4)+1))"
echo "last IP:   $((i1 & m1 | 255-m1)).$((i2 & m2 | 255-m2)).$((i3 & m3 | 255-m3)).$(((i4 & m4 | 255-m4)-1))"
echo "broadcast: $((i1 & m1 | 255-m1)).$((i2 & m2 | 255-m2)).$((i3 & m3 | 255-m3)).$((i4 & m4 | 255-m4))"
	
fi


