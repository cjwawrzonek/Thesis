#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention106/attention106.exp"
if [ -f $FPATH ]; then
	python experiment.py attention106 exps_set2/attention106
fi