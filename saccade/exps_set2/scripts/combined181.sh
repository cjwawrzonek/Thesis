#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined181/combined181.exp"
if [ -f $FPATH ]; then
	python experiment.py combined181 exps_set2/combined181
fi