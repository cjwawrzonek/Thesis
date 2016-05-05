#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined102/combined102.exp"
if [ -f $FPATH ]; then
	python experiment.py combined102 exps_set2/combined102
fi