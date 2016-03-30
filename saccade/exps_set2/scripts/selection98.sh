#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection98/selection98.exp"
if [ -f $FPATH ]; then
	python experiment.py selection98 exps_set2/selection98
fi