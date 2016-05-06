#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/attention25/attention25.exp"
if [ -f $FPATH ]; then
	python experiment.py attention25 exps_set4/attention25
fi