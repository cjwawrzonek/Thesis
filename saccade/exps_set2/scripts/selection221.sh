#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection221/selection221.exp"
if [ -f $FPATH ]; then
	python experiment.py selection221 exps_set2/selection221
fi