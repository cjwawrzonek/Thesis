#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined255/combined255.exp"
if [ -f $FPATH ]; then
	python experiment.py combined255 exps_set2/combined255
fi