#!/bin/bash
mpirun --allow-as-root -np 12 mb "$@" > mrbayes.log
