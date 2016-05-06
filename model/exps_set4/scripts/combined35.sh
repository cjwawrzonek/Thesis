#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/combined35/combined35.exp"
if [ -f $FPATH ]; then
	python experiment.py combined35 exps_set4/combined35
fi