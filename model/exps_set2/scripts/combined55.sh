#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined55/combined55.exp"
if [ -f $FPATH ]; then
	python experiment.py combined55 exps_set2/combined55
fi