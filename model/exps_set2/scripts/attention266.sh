#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention266/attention266.exp"
if [ -f $FPATH ]; then
	python experiment.py attention266 exps_set2/attention266
fi