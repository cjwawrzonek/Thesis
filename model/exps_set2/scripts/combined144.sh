#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined144/combined144.exp"
if [ -f $FPATH ]; then
	python experiment.py combined144 exps_set2/combined144
fi