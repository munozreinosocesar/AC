#!/bin/bash


OMP_NUM_THREADS=4



for ((A=100; A<1500; A=A+100))
do
        "./$1" $A

done


