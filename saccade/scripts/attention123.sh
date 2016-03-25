#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention123/attention123.exp"
if [ -f $FPATH ]; then
	python experiment.py attention123 experiments/attention123
fi