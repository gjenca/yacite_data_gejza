#!/bin/bash
yacite read data | yacite filter 'year >=2011 and "voc2011" not in tags' > voc2012.yaml
yacite filter '("wos" in tags or "sci" in tags or "scopus" in tags) and not "dautor" in tags' > voc2012.sci.no.dautor.yaml < voc2012.yaml
yacite filter '("wos" in tags or "sci" in tags or "scopus" in tags) and "dautor" in tags' > voc2012.sci.dautor.yaml < voc2012.yaml
