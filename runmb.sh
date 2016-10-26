#!/bin/bash
mpirun -np 12 mb "$@" > mrbayes.log
