#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined172/combined172.exp"
if [ -f $FPATH ]; then
	python experiment.py combined172 exps_set2/combined172
fi