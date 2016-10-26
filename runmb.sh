#!/bin/bash
mpirun --allow-run-as-root -np 12 mb "$@" > mrbayes.log
