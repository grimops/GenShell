#!/bin/bash

# check if there is enough arguments
if [ $# -lt 1 ]
then
        echo "[-] Not enough arguments"
        exit 1
fi

# save shell code to variable
shell_code=$(objdump -D -M intel $1 | grep '[0-9a-f]:' | grep -v 'file' | cut -f2 -d: | cut -f1-7 -d' ' | tr -s ' ' | tr '\t' ' ' | sed 's/ $//g' | sed 's/ /\\\x/g' | paste -d '' -s)


# Each of these commands are looking for bad characters and alerting the user if there is any
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

# This command highlights the bad characters
echo $shell_code | grep --color -E 'x00|xff|x0d|x0a'

# This will show the user the shell code with no bad characters
if [ $? -eq 1 ]
then
        echo $shell_code
        exit 0
fi

exit 1
