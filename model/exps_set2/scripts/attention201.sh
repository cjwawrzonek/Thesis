#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention201/attention201.exp"
if [ -f $FPATH ]; then
	python experiment.py attention201 exps_set2/attention201
fi