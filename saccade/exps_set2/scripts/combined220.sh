#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined220/combined220.exp"
if [ -f $FPATH ]; then
	python experiment.py combined220 exps_set2/combined220
fi