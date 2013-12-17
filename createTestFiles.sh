#!/bin/bash
read -p "How many test files would you like to create? " N
read -p "How large would you like your test files? (i.e. 10m = 10 mb) " Z
x=0
y=$N
z=$Z
for ((i=x; i<=y; i++)); do mkfile $Z output$i.dat; done
