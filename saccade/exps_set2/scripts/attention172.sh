#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention172/attention172.exp"
if [ -f $FPATH ]; then
	python experiment.py attention172 exps_set2/attention172
fi