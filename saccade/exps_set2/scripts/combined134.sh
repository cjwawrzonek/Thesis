#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined134/combined134.exp"
if [ -f $FPATH ]; then
	python experiment.py combined134 exps_set2/combined134
fi