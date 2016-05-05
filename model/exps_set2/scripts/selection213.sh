#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection213/selection213.exp"
if [ -f $FPATH ]; then
	python experiment.py selection213 exps_set2/selection213
fi