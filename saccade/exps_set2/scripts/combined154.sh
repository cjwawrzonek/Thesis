#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined154/combined154.exp"
if [ -f $FPATH ]; then
	python experiment.py combined154 exps_set2/combined154
fi