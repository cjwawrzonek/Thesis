#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined291/combined291.exp"
if [ -f $FPATH ]; then
	python experiment.py combined291 exps_set2/combined291
fi