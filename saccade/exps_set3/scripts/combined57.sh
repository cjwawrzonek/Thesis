#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/combined57/combined57.exp"
if [ -f $FPATH ]; then
	python experiment.py combined57 exps_set3/combined57
fi