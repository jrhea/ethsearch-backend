#!/bin/bash

mkdir -p apache-nutch-1.16-orig/src

# download nutch
curl -o apache-nutch-1.16-bin.tar.gz http://apache.claz.org/nutch/1.16/apache-nutch-1.16-bin.tar.gz \
    && tar xvzf apache-nutch-1.16-bin.tar.gz -C apache-nutch-1.16-orig \
    && curl -o apache-nutch-1.16-src.tar.gz http://apache.claz.org/nutch/1.16/apache-nutch-1.16-src.tar.gz \
    && tar xvzf apache-nutch-1.16-src.tar.gz -C apache-nutch-1.16-orig/src

# generate a patch by comparing existing nutch folder to the newly downloaded version
diff -Naur -x crawl -x *.html -x *.jar -x *ivy -x *logs -x src apache-nutch-1.16-orig apache-nutch-1.16 > nutch.patch
