#!/bin/bash
for i in {1..254}; do ping -c 192.168.1.$i | grep "bytes from" | cut -d " " -f 4 | cut -d ":" -f 1 done;