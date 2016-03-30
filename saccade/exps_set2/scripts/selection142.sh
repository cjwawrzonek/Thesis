#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection142/selection142.exp"
if [ -f $FPATH ]; then
	python experiment.py selection142 exps_set2/selection142
fi