#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection105/selection105.exp"
if [ -f $FPATH ]; then
	python experiment.py selection105 exps_set2/selection105
fi