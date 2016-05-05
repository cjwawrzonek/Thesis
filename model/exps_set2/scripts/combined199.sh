#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined199/combined199.exp"
if [ -f $FPATH ]; then
	python experiment.py combined199 exps_set2/combined199
fi