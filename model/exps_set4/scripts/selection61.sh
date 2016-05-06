#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/selection61/selection61.exp"
if [ -f $FPATH ]; then
	python experiment.py selection61 exps_set4/selection61
fi