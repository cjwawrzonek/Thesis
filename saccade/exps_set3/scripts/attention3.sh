#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/attention3/attention3.exp"
if [ -f $FPATH ]; then
	python experiment.py attention3 exps_set3/attention3
fi