#!/bin/bash

echo "Subdomains found:"
echo "-----------------"

for sub in $(curl -s -L $1 | grep href= | cut -d "/" -f 3 | grep $1 | cut -d '"' -f 1 | sort -u);do
	ip=$(host $sub | grep "has address" | cut -d " " -f 4)

	if [ "${#ip}" -ne "0" ]; then
		echo "$sub -> $ip"
	fi
done
