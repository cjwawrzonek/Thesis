#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention144/attention144.exp"
if [ -f $FPATH ]; then
	python experiment.py attention144 exps_set2/attention144
fi