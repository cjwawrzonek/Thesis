#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/attention47/attention47.exp"
if [ -f $FPATH ]; then
	python experiment.py attention47 exps_set4/attention47
fi