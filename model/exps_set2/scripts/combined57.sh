#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined57/combined57.exp"
if [ -f $FPATH ]; then
	python experiment.py combined57 exps_set2/combined57
fi