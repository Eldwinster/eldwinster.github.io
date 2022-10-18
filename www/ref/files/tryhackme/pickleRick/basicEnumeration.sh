#!/usr/bin/env/bash
ip="10.10.17.158"
url="10-10-17-158.p.thmlabs.com"
path=$(pwd)
timestamp=$(date +"%Y-%m-%dT%H:%M:%S")
nmap_report="${path}"/nmap_report_"${url}"_"${timestamp}".txt
gobuster_report="${path}"/gobuster_report_"${url}"_"${timestamp}".txt
directory_wordlist="/usr/share/seclists/Discovery/Web-Content/directory-list-2.3-medium.txt"
while :
      do
          if nmap -sn $ip; then
              nmap -vvv -T4 -sC -sV -A -p- "${ip}" -oG "${nmap_report}"
          fi
          if nmap -sn $ip; then
              gobuster dir -n -t 64\
                  -x php,sh,txt,cgi,html,css,js,py,jpg,jpeg,png,gif \
                  -u "${url}" \
                  -w "${directory_wordlist}" \
                  -o "${gobuster_report}"
              break
          fi
done
