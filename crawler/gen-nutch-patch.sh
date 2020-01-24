#!/bin/bash

if [ ! -d "apache-nutch-1.16" ]; then
    echo "You don't have a local copy of Apache Nutch configured for ethsear.ch"
    exit 1
fi

# if a fresh copy of apache-nutch doesn't exist go ahead and download it
if [ ! -d "apache-nutch-1.16-orig" ]; then
    mkdir -p apache-nutch-1.16-orig/src
    curl -o apache-nutch-1.16-bin.tar.gz http://apache.claz.org/nutch/1.16/apache-nutch-1.16-bin.tar.gz \
        && tar xvzf apache-nutch-1.16-bin.tar.gz -C apache-nutch-1.16-orig \
        && curl -o apache-nutch-1.16-src.tar.gz http://apache.claz.org/nutch/1.16/apache-nutch-1.16-src.tar.gz \
        && tar xvzf apache-nutch-1.16-src.tar.gz -C apache-nutch-1.16-orig/src
fi

# generate a patch by comparing existing nutch folder to the newly downloaded version
diff -Naur -x crawl -x *.html -x *.jar -x *ivy -x *logs -x src apache-nutch-1.16-orig apache-nutch-1.16 > nutch.patch
exit 0
