#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined221/combined221.exp"
if [ -f $FPATH ]; then
	python experiment.py combined221 exps_set2/combined221
fi