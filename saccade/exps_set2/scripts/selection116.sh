#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection116/selection116.exp"
if [ -f $FPATH ]; then
	python experiment.py selection116 exps_set2/selection116
fi