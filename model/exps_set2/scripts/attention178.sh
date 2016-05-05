#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention178/attention178.exp"
if [ -f $FPATH ]; then
	python experiment.py attention178 exps_set2/attention178
fi