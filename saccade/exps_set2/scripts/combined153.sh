#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined153/combined153.exp"
if [ -f $FPATH ]; then
	python experiment.py combined153 exps_set2/combined153
fi