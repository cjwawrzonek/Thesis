#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection92/selection92.exp"
if [ -f $FPATH ]; then
	python experiment.py selection92 exps_set2/selection92
fi