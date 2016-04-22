#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/attention35/attention35.exp"
if [ -f $FPATH ]; then
	python experiment.py attention35 exps_set3/attention35
fi