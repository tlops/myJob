#!/bin/bash
for i in `seq 0 10` do 
    echo "$((i++))" 2>/dev/null
done
