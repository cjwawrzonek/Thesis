#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention186/attention186.exp"
if [ -f $FPATH ]; then
	python experiment.py attention186 exps_set2/attention186
fi