#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/combined87/combined87.exp"
if [ -f $FPATH ]; then
	python experiment.py combined87 exps_set4/combined87
fi