import sys

exp = 1

while exp < 37:
	f = open("scripts/attention{}.sh".format(exp), "wb+")
	fstring = '''#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
python experiment.py attention{}'''.format(exp)
	f.write(fstring)
	f.close()
	exp += 1