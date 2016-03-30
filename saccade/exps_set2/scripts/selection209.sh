#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection209/selection209.exp"
if [ -f $FPATH ]; then
	python experiment.py selection209 exps_set2/selection209
fi