#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention102/attention102.exp"
if [ -f $FPATH ]; then
	python experiment.py attention102 exps_set2/attention102
fi