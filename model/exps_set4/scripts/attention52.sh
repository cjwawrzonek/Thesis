#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/attention52/attention52.exp"
if [ -f $FPATH ]; then
	python experiment.py attention52 exps_set4/attention52
fi