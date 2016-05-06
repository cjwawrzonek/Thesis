#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/combined55/combined55.exp"
if [ -f $FPATH ]; then
	python experiment.py combined55 exps_set4/combined55
fi