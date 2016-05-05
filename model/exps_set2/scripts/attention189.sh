#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention189/attention189.exp"
if [ -f $FPATH ]; then
	python experiment.py attention189 exps_set2/attention189
fi