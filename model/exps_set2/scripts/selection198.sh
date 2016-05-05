#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection198/selection198.exp"
if [ -f $FPATH ]; then
	python experiment.py selection198 exps_set2/selection198
fi