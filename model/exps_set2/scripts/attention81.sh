#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention81/attention81.exp"
if [ -f $FPATH ]; then
	python experiment.py attention81 exps_set2/attention81
fi