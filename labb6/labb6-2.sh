#!/bin/bash
# This Script deletes the content of the named file
# /tmp/testdir/ but requires root user privilegdes.
# 
# Falade Olumuyiwa LX13
# labb 6 uppgift 2
if [ $EUID -eq 0 ]; then
    rm -rf /tmp/testdir/*
    echo "files has been deleted!"
else 
    echo "Contact your ADMINISTRATOR to run this command!"
fi
exit 0

    
