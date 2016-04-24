#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/attention70/attention70.exp"
if [ -f $FPATH ]; then
	python experiment.py attention70 exps_set3/attention70
fi