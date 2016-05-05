#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention208/attention208.exp"
if [ -f $FPATH ]; then
	python experiment.py attention208 exps_set2/attention208
fi