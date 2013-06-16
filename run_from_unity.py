import sys
import os
import time

args = sys.argv[1].split(';')
print('args[0]=' + args[0])
os.system('vim' + ' ' + args[0] + ' ++' + args[1]);
