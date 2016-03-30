#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention123/attention123.exp"
if [ -f $FPATH ]; then
	python experiment.py attention123 exps_set2/attention123
fi