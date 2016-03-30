#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined139/combined139.exp"
if [ -f $FPATH ]; then
	python experiment.py combined139 exps_set2/combined139
fi