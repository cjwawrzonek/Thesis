#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined111/combined111.exp"
if [ -f $FPATH ]; then
	python experiment.py combined111 exps_set2/combined111
fi