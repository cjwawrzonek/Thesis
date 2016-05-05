#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection191/selection191.exp"
if [ -f $FPATH ]; then
	python experiment.py selection191 exps_set2/selection191
fi