SHELL := /bin/sh

include config.mk

crawler-%:
	cd $(CRAWLER_DIR) && make $@

search-%:
	cd $(SEARCH_DIR) && make $@
