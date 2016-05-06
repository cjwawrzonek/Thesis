#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/attention93/attention93.exp"
if [ -f $FPATH ]; then
	python experiment.py attention93 exps_set4/attention93
fi