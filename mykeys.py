import sys
import yaml

from yacite.types import Datadir

dd=Datadir("data")
for bi in dd:
    if "myown" in bi and bi["myown"]:
        print bi["key"]

