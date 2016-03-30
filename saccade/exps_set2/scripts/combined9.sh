#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined9/combined9.exp"
if [ -f $FPATH ]; then
	python experiment.py combined9 exps_set2/combined9
fi