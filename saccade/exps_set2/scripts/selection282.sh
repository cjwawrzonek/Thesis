#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection282/selection282.exp"
if [ -f $FPATH ]; then
	python experiment.py selection282 exps_set2/selection282
fi