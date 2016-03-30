#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention285/attention285.exp"
if [ -f $FPATH ]; then
	python experiment.py attention285 exps_set2/attention285
fi