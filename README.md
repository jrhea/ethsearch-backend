# config

## Crawler

### Run Crawler

**build**

```bash
$ make crawler-build
```

**crawl**

```bash
$ make crawler-run
root@75f4bffa69e8:~# cd apache-nutch-1.16 && bin/crawl -i -s urls/seed.txt crawl 3
```

### Update configs

In order to update the crawler configs, it is assumed that you have an existing local copy of apache-nutch-1.16 in the current dir.

1) Generate new `nutch.patch`
```bash
  sh gen-nutch-patch.sh 
```

2) Push the modified `nutch.patch` file to the repo

3) Follow the steps in the `Run Crawler` section to update the search indexes.
