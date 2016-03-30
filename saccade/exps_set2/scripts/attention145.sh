#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention145/attention145.exp"
if [ -f $FPATH ]; then
	python experiment.py attention145 exps_set2/attention145
fi