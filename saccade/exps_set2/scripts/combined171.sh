#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined171/combined171.exp"
if [ -f $FPATH ]; then
	python experiment.py combined171 exps_set2/combined171
fi