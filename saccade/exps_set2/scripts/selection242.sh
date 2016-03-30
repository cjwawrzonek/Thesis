#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection242/selection242.exp"
if [ -f $FPATH ]; then
	python experiment.py selection242 exps_set2/selection242
fi