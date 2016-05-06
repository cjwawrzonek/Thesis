#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/combined46/combined46.exp"
if [ -f $FPATH ]; then
	python experiment.py combined46 exps_set4/combined46
fi