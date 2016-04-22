#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/attention48/attention48.exp"
if [ -f $FPATH ]; then
	python experiment.py attention48 exps_set3/attention48
fi