#!/bin/bash

for i in $`sudo nmap 192.168.1.1-30 | grep "for" | awk '{ print $5}'`; do echo $i; done
