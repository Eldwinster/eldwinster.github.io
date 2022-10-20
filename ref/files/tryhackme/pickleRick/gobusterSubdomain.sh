#!/bin/bash
ip="10.10.17.158"
url="10-10-17-158.p.thmlabs.com"
wordlist="/usr/share/seclists/Discovery/DNS/subdomains-top1million-110000.txt"
path=$(pwd)
timestamp=$(date +"%Y-%m-%dT%H:%M:%S")
file="${path}"/subdomain_enumeration_"${url}"_"${timestamp}".txt
while :
      do
          if nmap -sn $ip ; then
              gobuster dns -v -t 64\
                  --wildcard\
                  -d "${url}" \
                  -w "${wordlist}" \
                  -o "${file}"
              break
          fi
done
