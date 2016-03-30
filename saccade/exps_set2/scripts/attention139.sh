#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention139/attention139.exp"
if [ -f $FPATH ]; then
	python experiment.py attention139 exps_set2/attention139
fi