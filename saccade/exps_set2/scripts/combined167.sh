#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined167/combined167.exp"
if [ -f $FPATH ]; then
	python experiment.py combined167 exps_set2/combined167
fi