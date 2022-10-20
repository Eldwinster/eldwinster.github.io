#!/bin/bash
url="10.10.17.158"
wordlist="/usr/share/seclists/Discovery/Web-Content/directory-list-2.3-small.txt"
path=$(pwd)
timestamp=$(date +"%Y-%m-%dT%H:%M:%S")
file="${path}"/"${url}"_"${timestamp}".txt
while :
      do
          if ping $url -c 1; then
              gobuster dir -n -t 64\
                  -u "${url}" \
                  -w "${wordlist}" \
                  -o "${file}"
              break
          fi
done
