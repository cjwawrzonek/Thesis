#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention217/attention217.exp"
if [ -f $FPATH ]; then
	python experiment.py attention217 exps_set2/attention217
fi