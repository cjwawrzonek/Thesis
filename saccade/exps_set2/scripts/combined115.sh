#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined115/combined115.exp"
if [ -f $FPATH ]; then
	python experiment.py combined115 exps_set2/combined115
fi