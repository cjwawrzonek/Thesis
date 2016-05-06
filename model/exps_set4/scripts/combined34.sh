#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/combined34/combined34.exp"
if [ -f $FPATH ]; then
	python experiment.py combined34 exps_set4/combined34
fi