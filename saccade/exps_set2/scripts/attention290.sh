#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention290/attention290.exp"
if [ -f $FPATH ]; then
	python experiment.py attention290 exps_set2/attention290
fi