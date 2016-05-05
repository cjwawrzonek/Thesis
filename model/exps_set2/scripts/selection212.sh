#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection212/selection212.exp"
if [ -f $FPATH ]; then
	python experiment.py selection212 exps_set2/selection212
fi