#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention191/attention191.exp"
if [ -f $FPATH ]; then
	python experiment.py attention191 exps_set2/attention191
fi