#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined91/combined91.exp"
if [ -f $FPATH ]; then
	python experiment.py combined91 exps_set2/combined91
fi