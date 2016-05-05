#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined202/combined202.exp"
if [ -f $FPATH ]; then
	python experiment.py combined202 exps_set2/combined202
fi