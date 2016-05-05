#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention163/attention163.exp"
if [ -f $FPATH ]; then
	python experiment.py attention163 exps_set2/attention163
fi