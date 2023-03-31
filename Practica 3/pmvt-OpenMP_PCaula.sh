#!/bin/bash


export OMP_SCHEDULE="static"
./$1 19200
export OMP_SCHEDULE="static,1"
./$1 19200
export OMP_SCHEDULE="static,64"
./$1 19200

export OMP_SCHEDULE="dynamic"
./$1 19200
export OMP_SCHEDULE="dynamic,1"
./$1 19200
export OMP_SCHEDULE="dynamic,64"
./$1 19200

export OMP_SCHEDULE="guided"
./$1 19200
export OMP_SCHEDULE="guided,1"
./$1 19200
export OMP_SCHEDULE="guided,64"
./$1 19200
