#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined173/combined173.exp"
if [ -f $FPATH ]; then
	python experiment.py combined173 exps_set2/combined173
fi