#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/attention53/attention53.exp"
if [ -f $FPATH ]; then
	python experiment.py attention53 exps_set3/attention53
fi