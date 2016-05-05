#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined163/combined163.exp"
if [ -f $FPATH ]; then
	python experiment.py combined163 exps_set2/combined163
fi