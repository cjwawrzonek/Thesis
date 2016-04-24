#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/attention63/attention63.exp"
if [ -f $FPATH ]; then
	python experiment.py attention63 exps_set3/attention63
fi