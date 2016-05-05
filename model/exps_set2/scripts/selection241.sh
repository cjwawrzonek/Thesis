#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection241/selection241.exp"
if [ -f $FPATH ]; then
	python experiment.py selection241 exps_set2/selection241
fi