#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined4/combined4.exp"
if [ -f $FPATH ]; then
	python experiment.py combined4 exps_set2/combined4
fi