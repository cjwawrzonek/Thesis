#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/attention40/attention40.exp"
if [ -f $FPATH ]; then
	python experiment.py attention40 exps_set4/attention40
fi