#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention242/attention242.exp"
if [ -f $FPATH ]; then
	python experiment.py attention242 exps_set2/attention242
fi