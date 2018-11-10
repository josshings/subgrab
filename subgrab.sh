#!/bin/bash

echo "Subdomains found:"
echo "-----------------"

for sub in $(cat subs.txt);do
	ip=$(host $sub | grep "has address" | cut -d " " -f 4)

	if [ "${#ip}" -ne "0" ]; then
		echo "$sub -> $ip"
	fi
done
