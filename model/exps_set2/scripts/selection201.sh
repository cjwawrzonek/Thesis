#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection201/selection201.exp"
if [ -f $FPATH ]; then
	python experiment.py selection201 exps_set2/selection201
fi