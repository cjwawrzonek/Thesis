#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection256/selection256.exp"
if [ -f $FPATH ]; then
	python experiment.py selection256 exps_set2/selection256
fi