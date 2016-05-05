#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined198/combined198.exp"
if [ -f $FPATH ]; then
	python experiment.py combined198 exps_set2/combined198
fi