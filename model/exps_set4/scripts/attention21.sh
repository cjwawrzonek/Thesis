#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/attention21/attention21.exp"
if [ -f $FPATH ]; then
	python experiment.py attention21 exps_set4/attention21
fi