#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention105/attention105.exp"
if [ -f $FPATH ]; then
	python experiment.py attention105 exps_set2/attention105
fi