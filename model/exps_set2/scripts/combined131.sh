#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined131/combined131.exp"
if [ -f $FPATH ]; then
	python experiment.py combined131 exps_set2/combined131
fi