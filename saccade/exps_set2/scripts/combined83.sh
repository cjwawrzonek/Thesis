#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined83/combined83.exp"
if [ -f $FPATH ]; then
	python experiment.py combined83 exps_set2/combined83
fi