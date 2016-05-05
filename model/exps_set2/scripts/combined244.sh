#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined244/combined244.exp"
if [ -f $FPATH ]; then
	python experiment.py combined244 exps_set2/combined244
fi