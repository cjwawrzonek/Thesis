#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/combined9/combined9.exp"
if [ -f $FPATH ]; then
	python experiment.py combined9 exps_set4/combined9
fi