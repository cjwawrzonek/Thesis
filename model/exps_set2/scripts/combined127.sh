#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined127/combined127.exp"
if [ -f $FPATH ]; then
	python experiment.py combined127 exps_set2/combined127
fi