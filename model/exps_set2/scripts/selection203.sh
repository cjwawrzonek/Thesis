#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection203/selection203.exp"
if [ -f $FPATH ]; then
	python experiment.py selection203 exps_set2/selection203
fi