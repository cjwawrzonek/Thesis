#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection131/selection131.exp"
if [ -f $FPATH ]; then
	python experiment.py selection131 exps_set2/selection131
fi