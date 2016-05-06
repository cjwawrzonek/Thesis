#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/attention20/attention20.exp"
if [ -f $FPATH ]; then
	python experiment.py attention20 exps_set4/attention20
fi