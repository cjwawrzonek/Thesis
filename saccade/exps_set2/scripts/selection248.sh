#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection248/selection248.exp"
if [ -f $FPATH ]; then
	python experiment.py selection248 exps_set2/selection248
fi