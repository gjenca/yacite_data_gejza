import sys
import yaml


for d in yaml.load_all(sys.stdin):
    print d

