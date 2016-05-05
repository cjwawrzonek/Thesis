#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection126/selection126.exp"
if [ -f $FPATH ]; then
	python experiment.py selection126 exps_set2/selection126
fi