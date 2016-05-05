#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection147/selection147.exp"
if [ -f $FPATH ]; then
	python experiment.py selection147 exps_set2/selection147
fi