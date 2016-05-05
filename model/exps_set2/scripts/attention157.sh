#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention157/attention157.exp"
if [ -f $FPATH ]; then
	python experiment.py attention157 exps_set2/attention157
fi