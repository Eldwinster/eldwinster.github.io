#!/bin/bash
url="shell.uploadvulns.thm"
wordlist="/usr/share/seclists/Discovery/Web-Content/directory-list-2.3-small.txt"
path=$(pwd)
timestamp=$(date +"%Y-%m-%dT%H:%M:%S")
directories=("content" "modules" "admin" "assets" "Content" "Assets" "Modules" "Admin" "%C0")
for directory in "${directories[@]}"; do
file="${path}"/"${url}"_"${directory}"_"${timestamp}".txt
    if ping $url -c 1; then
        gobuster dir -q -t 64 -x .html,.conf,.php,js,.css,txt,jpg,jpeg,png \
            -u $url \
            -w $wordlist \
            -o "${file}"
       fi
done
