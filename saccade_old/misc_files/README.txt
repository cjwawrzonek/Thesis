Hello! The code has been scrubbed clean to the bare minimum that you'll need to run the model. As it stands now, this is still a prototype that I'm working on, so there is no central script to run all the moving parts at once, which is quite a hassle for you I'm sure. I'm in the process right now of creating a central control scheme to make it easier for others to use the code. I had no idea Tim was planning on giving this to others to use. So sorry for the mess! Here is how to use it right now.

Training a new rnn is easy, simply run ~~python model.py from your command line. However, the model works by reading in weights and inputs from saved files, so make sure you have these in the same directory. I provided some defaults to use. If you'd like to use the default files, answer yes to the question and decide what kind of inputs to use.

If you don't want to use the default files, you can create new initialized weights and inputs as follows:

To make a new "weights_matrix" file, run "weights.m" in matlab with appropriate parameters. This is the matrix of initializations of non-zero weights. I've found that 'weights(12,.15,[-1,1], 1)' produces weights closest to Marten's sparse initialization and trains the best, but again, this is a hyper parameter that I need to explore further. Pavlos can give you details on this file and its arguments.

To make a new "DelayedSaccadeTrain.txt" file, run "input_file()" in matlab. These are the input patterns for the delayed saccade task.

"W" is created on its own when training a new network, so you don't need to worry about creating your own.

Tools I provided that are modularized:

model.py - this is the file the creates and trains a new model
activations_visualizer.py - this produces a nice step by step show of the activations of the hidden layer on a trained network
pca.py - this does a pca analysis on the activations of the hidden layer of a trained network and creates nice graphs for you of a few PCs.

Additional tools that are not modularized yet:
w_dist.py - this is a cool tool that shows a function of weights with respect to distance away from the connected neuron after training. I hard 	coded the file names in this one so its not modularized yet, but you can still run it to generate the graph from my paper.
weights_visualizer.py - this produces a nice color map of the weights in the hidden layer between all neurons after training. Again, hard coded 	files, but it is still interesting to look at.

The last two files:

hessianrnn.py
hessianbackprop.py

These two files are a messy mash of Daniel's and my code. Its long and messy and I haven't had a chance to comment it all yet. They implement all the workings of the rnn and the hessian free optimization algorithm You shouldn't need to look in these files to use the model, but should you have any questions, feel free to ask me or look through the code yourself.