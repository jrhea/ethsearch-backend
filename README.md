# config

## Update Solr with latest urls

1. build container:

```bash
$ make build
```

2. run container

```bash
$ make run
```

3. start crawl

```bash
root@75f4bffa69e8:~# cd apache-nutch-1.16
root@75f4bffa69e8:~/apache-nutch-1.16# bin/crawl -i -s urls/seed.txt crawl 3
```

