#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined168/combined168.exp"
if [ -f $FPATH ]; then
	python experiment.py combined168 exps_set2/combined168
fi