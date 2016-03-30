#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection264/selection264.exp"
if [ -f $FPATH ]; then
	python experiment.py selection264 exps_set2/selection264
fi