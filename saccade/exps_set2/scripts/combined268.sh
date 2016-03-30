#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined268/combined268.exp"
if [ -f $FPATH ]; then
	python experiment.py combined268 exps_set2/combined268
fi