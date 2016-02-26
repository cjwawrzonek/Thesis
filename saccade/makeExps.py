import sys

exp = 1

for locs in [4, 8, 16]:
	for pct in [50, 75, 100]:
		for layer in [16, 25, 64, 144]:
			fpath = "attention" + str(exp) + "/" + "attention" + str(exp) + ".exp"
			f = open(fpath, "wb+")

			f.write('''## Attention Experiment
description	Attention experiment
directory	attention{}
type	attention
total_length	18
phase_times	{{"delay":5,"output":5,"cue":3,"locs":5}}
num_locs	{}
input_side	11
hidden_layer	{}
out_layer	4
init_weights	init_weights
train_shuffle	true
loc_connect	false
phase_var	{{"delay":false,"cue":false,"locs":false}}
variance	2
train_pct	{}'''.format(exp, locs, layer, pct))
			f.close()
			exp += 1