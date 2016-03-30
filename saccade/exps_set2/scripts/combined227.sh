#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined227/combined227.exp"
if [ -f $FPATH ]; then
	python experiment.py combined227 exps_set2/combined227
fi