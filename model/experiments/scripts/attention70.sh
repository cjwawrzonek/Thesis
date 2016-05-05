#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention70/attention70.exp"
if [ -f $FPATH ]; then
	python experiment.py attention70 experiments/attention70
fi