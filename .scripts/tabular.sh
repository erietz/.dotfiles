#!/bin/bash
cd $PWD

echo 'Which character is separating values?'
echo 'comma 	=	,'
echo 'tab 	= 	tab'
echo 'colon 	= 	:'
echo 'space	=	\ '
read delimeter

if [ $delimeter = "tab" ];
then 
	delimeter="	"
fi

sed "s/$delimeter/	\&	/g; s/$/	\\\\\\\/" $1

