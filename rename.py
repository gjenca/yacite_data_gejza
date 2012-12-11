import sys
import yaml

from yacite.types import Datadir
from yacite.types import makekey

dd=Datadir("data")
for bi in dd:
    if "myown" in bi and bi["myown"]:
        bi.path=None
        bi.dirty=True
        bi.save()
        print bi.path


