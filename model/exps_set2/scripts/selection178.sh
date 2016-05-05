#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection178/selection178.exp"
if [ -f $FPATH ]; then
	python experiment.py selection178 exps_set2/selection178
fi