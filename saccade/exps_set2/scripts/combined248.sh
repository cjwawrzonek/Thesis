#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined248/combined248.exp"
if [ -f $FPATH ]; then
	python experiment.py combined248 exps_set2/combined248
fi