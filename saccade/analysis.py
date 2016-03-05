import random
import math
import os

import numpy as np
from pprint import pprint
import sys
from hessianbackprop import HessianBackprop
from hessianrnn import HessianRNN
import utility as util
import experiment as e

def analysis(exp):
    pass

def main():
    # if len(sys.argv) < 2:
    #     raise Exception("Usage: python analysis.py [exp path name]")
    # expPath = sys.argv[1]

    # exp = e.experiment()
    # exp.read(expPath, W=True)

    # print exp
    # print exp.trainError()
    errors = []

    for expType in ['attention', 'selection', 'combined']:
        expNum = 1
        expPath = "experiments/{}{}/{}{}.exp".format(expType, expNum, expType, expNum)

        while (os.path.exists(expPath)):
            try:
                exp = e.experiment()
                exp.read(expPath, W=True)
                errors.append(["{}{}".format(expType, expNum), exp.trainError()])
            except:
                pass
            expNum += 1
            expPath = "experiments/{}{}/{}{}.exp".format(expType, expNum, expType, expNum)
            print expPath

    errors = sorted(errors,key=lambda x: x[0])
    pprint(errors)

if __name__ == "__main__":
    main()