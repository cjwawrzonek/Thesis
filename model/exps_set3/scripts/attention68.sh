#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/attention68/attention68.exp"
if [ -f $FPATH ]; then
	python experiment.py attention68 exps_set3/attention68
fi