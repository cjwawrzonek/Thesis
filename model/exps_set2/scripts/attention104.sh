#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention104/attention104.exp"
if [ -f $FPATH ]; then
	python experiment.py attention104 exps_set2/attention104
fi