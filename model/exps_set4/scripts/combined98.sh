#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/combined98/combined98.exp"
if [ -f $FPATH ]; then
	python experiment.py combined98 exps_set4/combined98
fi