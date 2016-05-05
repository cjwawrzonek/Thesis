#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection220/selection220.exp"
if [ -f $FPATH ]; then
	python experiment.py selection220 exps_set2/selection220
fi