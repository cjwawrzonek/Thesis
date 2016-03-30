#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined177/combined177.exp"
if [ -f $FPATH ]; then
	python experiment.py combined177 exps_set2/combined177
fi