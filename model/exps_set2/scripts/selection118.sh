#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection118/selection118.exp"
if [ -f $FPATH ]; then
	python experiment.py selection118 exps_set2/selection118
fi