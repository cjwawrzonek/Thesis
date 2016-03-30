#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined213/combined213.exp"
if [ -f $FPATH ]; then
	python experiment.py combined213 exps_set2/combined213
fi