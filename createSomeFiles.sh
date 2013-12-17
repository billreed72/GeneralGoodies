#!/bin/bash
read -p "How many files do you want to create? :" N
read -p "What size do you want each file? (size[b|k|m|g] i.e. 10m=10MB) :" size
read -p "Enter a prefix name for your test files. (i.e. testFile) :" prefix
x=1
y=$N
size=$size
prefix=$prefix
for ((i=x; i<=y; i++)); do mkfile $size $prefix$i.txt; 
ls -lh $prefix*;done
