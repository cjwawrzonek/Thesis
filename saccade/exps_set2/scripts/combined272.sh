#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined272/combined272.exp"
if [ -f $FPATH ]; then
	python experiment.py combined272 exps_set2/combined272
fi