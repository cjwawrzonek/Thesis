#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/combined26/combined26.exp"
if [ -f $FPATH ]; then
	python experiment.py combined26 exps_set3/combined26
fi