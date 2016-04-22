#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/attention46/attention46.exp"
if [ -f $FPATH ]; then
	python experiment.py attention46 exps_set3/attention46
fi