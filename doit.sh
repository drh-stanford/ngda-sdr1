#!/bin/bash

#find data/rumsey -name '*.xml' -print0 | xargs -0 -n 1 xsltproc rumsey.xslt > rumsey.csv
#find data/naip -name '*.xml' -print0 | xargs -0 -n 1 xsltproc naip.xslt > naip.csv
find data/sgs -name '*.xml' -print0 | xargs -0 -n 1 xsltproc sgs.xslt > sgs.csv
#find data/hro/mods -name '*.xml' -print0 | xargs -0 -n 1 xsltproc hro.xslt > hro.csv
#find data/ned -name '*_mets.xml' -print0 | xargs -0 -n 1 xsltproc ned.xslt > ned.csv
#find data/tpc -name '*_mets.xml' -print0 | xargs -0 -n 1 xsltproc tpc.xslt > tpc.csv

#xsltproc landsat7.xslt landsat7n_mets.xml > landsat7.csv
#xsltproc landsat7.xslt landsat7s_mets.xml >> landsat7.csv
#xsltproc landsat7.xslt landsat45_mets.xml > landsat45.csv
