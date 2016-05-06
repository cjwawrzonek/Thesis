#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/combined97/combined97.exp"
if [ -f $FPATH ]; then
	python experiment.py combined97 exps_set4/combined97
fi