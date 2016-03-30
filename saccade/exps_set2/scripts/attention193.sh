#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention193/attention193.exp"
if [ -f $FPATH ]; then
	python experiment.py attention193 exps_set2/attention193
fi