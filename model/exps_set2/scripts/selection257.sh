#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection257/selection257.exp"
if [ -f $FPATH ]; then
	python experiment.py selection257 exps_set2/selection257
fi