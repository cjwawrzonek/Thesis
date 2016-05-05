#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined263/combined263.exp"
if [ -f $FPATH ]; then
	python experiment.py combined263 exps_set2/combined263
fi