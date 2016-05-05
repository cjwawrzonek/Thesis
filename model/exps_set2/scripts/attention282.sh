#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention282/attention282.exp"
if [ -f $FPATH ]; then
	python experiment.py attention282 exps_set2/attention282
fi