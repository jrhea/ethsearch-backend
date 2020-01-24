crawler-update-seedurls:
	sh gen-nutch-patch.sh

crawler-build:
	docker build --build-arg CRAWL_VER=$(shell date +%s) -t ethsearch/crawler .

crawler-rebuild:
	docker build --no-cache -t ethsearch/crawler .

crawler-run:
	docker run --rm -it ethsearch/crawler

crawler-push:
	docker login && docker push ethsearch/crawler
