#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/combined22/combined22.exp"
if [ -f $FPATH ]; then
	python experiment.py combined22 exps_set3/combined22
fi