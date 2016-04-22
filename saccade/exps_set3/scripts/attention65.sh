#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/attention65/attention65.exp"
if [ -f $FPATH ]; then
	python experiment.py attention65 exps_set3/attention65
fi