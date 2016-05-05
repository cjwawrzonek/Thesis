#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection165/selection165.exp"
if [ -f $FPATH ]; then
	python experiment.py selection165 exps_set2/selection165
fi