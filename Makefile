
build:
	docker build -t jrhea/ethsearch .

run:
	docker run --rm -it jrhea/ethsearch

push:
	docker login && docker push jrhea/ethsearch
