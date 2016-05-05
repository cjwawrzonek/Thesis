#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined216/combined216.exp"
if [ -f $FPATH ]; then
	python experiment.py combined216 exps_set2/combined216
fi