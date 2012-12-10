import sys
import yaml

from yacite.types import Datadir
from yacite.types import makekey

dd=Datadir("data")
keypairs={}
for bi in dd:
    if "myown" in bi and bi["myown"]:
        oldkey=bi["key"]
        newkey=makekey(bi,dd)
        keypairs[oldkey]=newkey
        bi["key"]=newkey
        dd.keys.remove(oldkey)
        dd.keys.append(newkey)

for bi in dd:
    if "myown" not in bi or not bi["myown"]:
        if "cites" in bi:
            newcites=[]
            for key in bi["cites"]:
                if key in keypairs:
                    newcites.append(keypairs[key])
            bi["cites"]=newcites

for bi in dd:
    bi.save()


