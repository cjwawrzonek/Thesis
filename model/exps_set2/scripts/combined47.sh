#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined47/combined47.exp"
if [ -f $FPATH ]; then
	python experiment.py combined47 exps_set2/combined47
fi