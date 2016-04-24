#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/attention16/attention16.exp"
if [ -f $FPATH ]; then
	python experiment.py attention16 exps_set3/attention16
fi