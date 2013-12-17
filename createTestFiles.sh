#!/bin/bash
read -p "How many test files would you like to create? " N
read -p "How large would you like your test files? (i.e. 10m = 10 mb): " size
read -p "Enter a prefix name for your test files. (i.e. testFile): " prefix
x=0
y=$N
size=$size
prefix=$prefix
for ((i=x; i<=y; i++)); do mkfile $size $prefix$i.dat; 
ls -lh $prefix*;done
