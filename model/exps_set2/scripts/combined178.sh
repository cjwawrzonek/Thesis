#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined178/combined178.exp"
if [ -f $FPATH ]; then
	python experiment.py combined178 exps_set2/combined178
fi