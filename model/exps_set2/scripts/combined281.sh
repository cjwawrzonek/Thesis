#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined281/combined281.exp"
if [ -f $FPATH ]; then
	python experiment.py combined281 exps_set2/combined281
fi