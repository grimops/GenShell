#!/bin/bash


if [ $# -lt 1 ]
then
        echo "[-] Not enough arguments"
        exit 1
fi


shell_code=$(objdump -D -M intel $1 | grep '[0-9a-f]:' | grep -v 'file' | cut -f2 -d: | cut -f1-7 -d' ' | tr -s ' ' | tr '\t' ' ' | sed 's/ $//g' | sed 's/ /\\\x/g' | paste -d '' -s)



echo $shell_code | grep --color x00 > /dev/null
if [ $? -eq 0 ]
then
        echo "[-] Bad characters found: x00"
fi

echo $shell_code | grep --color \x0a > /dev/null
if [ $? -eq 0 ]
then
        echo "[-] Bad characters found: x0a"
fi

echo $shell_code | grep --color xff > /dev/null
if [ $? -eq 0 ]
then
        echo "[-] Bad characters found: xff"
fi

echo $shell_code | grep --color x0d > /dev/null
if [ $? -eq 0 ]
then
        echo "[-] Bad characters found: x0d"
fi

echo $shell_code | grep --color -E 'x00|xff|x0d|x0a'

if [ $? -eq 1 ]
then
        echo $shell_code
        exit 0
fi

exit 1
