#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention251/attention251.exp"
if [ -f $FPATH ]; then
	python experiment.py attention251 exps_set2/attention251
fi