#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection270/selection270.exp"
if [ -f $FPATH ]; then
	python experiment.py selection270 exps_set2/selection270
fi