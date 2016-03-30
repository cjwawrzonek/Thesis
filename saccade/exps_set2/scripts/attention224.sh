#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention224/attention224.exp"
if [ -f $FPATH ]; then
	python experiment.py attention224 exps_set2/attention224
fi