#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention203/attention203.exp"
if [ -f $FPATH ]; then
	python experiment.py attention203 exps_set2/attention203
fi