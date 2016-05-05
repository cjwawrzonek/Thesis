#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined253/combined253.exp"
if [ -f $FPATH ]; then
	python experiment.py combined253 exps_set2/combined253
fi