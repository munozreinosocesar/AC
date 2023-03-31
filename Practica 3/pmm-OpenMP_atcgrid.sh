#!/bin/bash


OMP_NUM_THREADS=12
for ((N=100; N<1500; N=N+100))
do
        time "./$1" $N
        echo ""
done

