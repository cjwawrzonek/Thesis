#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection23/selection23.exp"
if [ -f $FPATH ]; then
	python experiment.py selection23 exps_set2/selection23
fi