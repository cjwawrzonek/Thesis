#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention25/attention25.exp"
if [ -f $FPATH ]; then
	python experiment.py attention25 exps_set2/attention25
fi