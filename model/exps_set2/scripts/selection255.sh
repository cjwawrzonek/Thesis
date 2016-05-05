#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection255/selection255.exp"
if [ -f $FPATH ]; then
	python experiment.py selection255 exps_set2/selection255
fi