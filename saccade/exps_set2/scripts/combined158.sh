#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined158/combined158.exp"
if [ -f $FPATH ]; then
	python experiment.py combined158 exps_set2/combined158
fi