#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/combined93/combined93.exp"
if [ -f $FPATH ]; then
	python experiment.py combined93 exps_set4/combined93
fi