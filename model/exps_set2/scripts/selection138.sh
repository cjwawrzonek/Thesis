#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection138/selection138.exp"
if [ -f $FPATH ]; then
	python experiment.py selection138 exps_set2/selection138
fi