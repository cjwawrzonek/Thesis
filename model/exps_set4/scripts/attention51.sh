#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/attention51/attention51.exp"
if [ -f $FPATH ]; then
	python experiment.py attention51 exps_set4/attention51
fi