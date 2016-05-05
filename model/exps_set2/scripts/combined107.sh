#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined107/combined107.exp"
if [ -f $FPATH ]; then
	python experiment.py combined107 exps_set2/combined107
fi