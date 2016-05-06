#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/combined21/combined21.exp"
if [ -f $FPATH ]; then
	python experiment.py combined21 exps_set4/combined21
fi