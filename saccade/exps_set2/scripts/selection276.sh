#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection276/selection276.exp"
if [ -f $FPATH ]; then
	python experiment.py selection276 exps_set2/selection276
fi