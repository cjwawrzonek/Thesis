#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined212/combined212.exp"
if [ -f $FPATH ]; then
	python experiment.py combined212 exps_set2/combined212
fi