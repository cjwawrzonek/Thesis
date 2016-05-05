#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined106/combined106.exp"
if [ -f $FPATH ]; then
	python experiment.py combined106 exps_set2/combined106
fi