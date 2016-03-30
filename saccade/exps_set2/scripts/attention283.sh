#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention283/attention283.exp"
if [ -f $FPATH ]; then
	python experiment.py attention283 exps_set2/attention283
fi