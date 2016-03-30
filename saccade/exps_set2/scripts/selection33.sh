#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection33/selection33.exp"
if [ -f $FPATH ]; then
	python experiment.py selection33 exps_set2/selection33
fi