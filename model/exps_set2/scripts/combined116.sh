#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined116/combined116.exp"
if [ -f $FPATH ]; then
	python experiment.py combined116 exps_set2/combined116
fi