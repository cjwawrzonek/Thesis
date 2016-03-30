#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection182/selection182.exp"
if [ -f $FPATH ]; then
	python experiment.py selection182 exps_set2/selection182
fi