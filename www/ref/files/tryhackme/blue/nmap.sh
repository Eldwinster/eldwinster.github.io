#!/usr/bin/env/bash
ip="10.10.2.37"
path=$(pwd)
timestamp=$(date +"%Y-%m-%dT%H:%M:%S")
file="${path}"/nmap-report-"${timestamp}".txt
while :
      do
          if nmap -sn "${ip}" && ping "${ip}" -c 1; then
              nmap -vvv -T4 -sC -sV -A --script vuln "${ip}" -oX "${file}"
              break
          fi
done
