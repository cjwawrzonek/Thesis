#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined129/combined129.exp"
if [ -f $FPATH ]; then
	python experiment.py combined129 exps_set2/combined129
fi