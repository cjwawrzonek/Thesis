#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/combined59/combined59.exp"
if [ -f $FPATH ]; then
	python experiment.py combined59 exps_set4/combined59
fi