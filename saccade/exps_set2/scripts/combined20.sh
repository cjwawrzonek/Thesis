#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined20/combined20.exp"
if [ -f $FPATH ]; then
	python experiment.py combined20 exps_set2/combined20
fi