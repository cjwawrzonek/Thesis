#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/attention43/attention43.exp"
if [ -f $FPATH ]; then
	python experiment.py attention43 exps_set3/attention43
fi