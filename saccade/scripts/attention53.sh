#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention53/attention53.exp"
if [ -f $FPATH ]; then
	python experiment.py attention53 experiments/attention53
fi