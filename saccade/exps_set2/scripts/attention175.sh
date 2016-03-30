#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention175/attention175.exp"
if [ -f $FPATH ]; then
	python experiment.py attention175 exps_set2/attention175
fi