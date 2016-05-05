#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection299/selection299.exp"
if [ -f $FPATH ]; then
	python experiment.py selection299 exps_set2/selection299
fi