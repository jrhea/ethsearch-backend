OS:=$(shell uname -s | tr '[:upper:]' '[:lower:]')
CC:=gcc
ifeq ($(OS), linux)
	JAVA_HOME:=$(shell java -XshowSettings:properties -version 2>&1 > /dev/null | grep 'java.home' | sed 's/\s*java.home = //' | sed 's/\/jre//')
else ifeq ($(OS), darwin)
	JAVA_HOME:=$(shell java -XshowSettings:properties -version 2>&1 > /dev/null | grep 'java.home' | sed 's/\s*java.home = //' | sed 's/\/jre//')
endif
ROOT_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
CRAWLER_DIR:=$(ROOT_DIR)/crawler
SEARCH_DIR:=$(ROOT_DIR)/search

debug-%: ; @echo $*=$($*)
