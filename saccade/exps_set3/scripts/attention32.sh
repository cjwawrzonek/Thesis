#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/attention32/attention32.exp"
if [ -f $FPATH ]; then
	python experiment.py attention32 exps_set3/attention32
fi