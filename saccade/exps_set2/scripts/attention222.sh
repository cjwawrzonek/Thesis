#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention222/attention222.exp"
if [ -f $FPATH ]; then
	python experiment.py attention222 exps_set2/attention222
fi