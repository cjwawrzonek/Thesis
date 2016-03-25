#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention163/attention163.exp"
if [ -f $FPATH ]; then
	python experiment.py attention163 experiments/attention163
fi