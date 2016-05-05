#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection164/selection164.exp"
if [ -f $FPATH ]; then
	python experiment.py selection164 exps_set2/selection164
fi