#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/combined51/combined51.exp"
if [ -f $FPATH ]; then
	python experiment.py combined51 exps_set3/combined51
fi