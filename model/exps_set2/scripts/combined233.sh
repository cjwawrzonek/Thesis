#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined233/combined233.exp"
if [ -f $FPATH ]; then
	python experiment.py combined233 exps_set2/combined233
fi