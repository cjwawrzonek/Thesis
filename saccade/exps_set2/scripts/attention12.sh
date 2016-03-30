#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention12/attention12.exp"
if [ -f $FPATH ]; then
	python experiment.py attention12 exps_set2/attention12
fi