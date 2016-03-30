#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention220/attention220.exp"
if [ -f $FPATH ]; then
	python experiment.py attention220 exps_set2/attention220
fi