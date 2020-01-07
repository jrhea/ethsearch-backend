FROM debian:stretch

WORKDIR /root/


# Install dependencies
RUN apt-get update
RUN apt-get install -y wget openjdk-8-jdk-headless curl git

# Set up JAVA_HOME
RUN echo 'export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64' >> $HOME/.bashrc

# Download nutch
RUN curl -o apache-nutch-1.16-bin.tar.gz http://apache.claz.org/nutch/1.16/apache-nutch-1.16-bin.tar.gz \
    && tar xvzf apache-nutch-1.16-bin.tar.gz \
    && curl -o apache-nutch-1.16-src.tar.gz http://apache.claz.org/nutch/1.16/apache-nutch-1.16-src.tar.gz \
    && mkdir -p apache-nutch-1.16/src \
    && tar xvzf apache-nutch-1.16-src.tar.gz -C apache-nutch-1.16/src

# Download nutch.patch from repo
RUN curl -o nutch.patch https://raw.githubusercontent.com/ethsearch/config/master/nutch.patch

# Apply nutch.patch 
RUN cd apache-nutch-1.16 && patch -p2 <../nutch.patch 

# Download solr
#RUN curl -o  https://archive.apache.org/dist/lucene/solr/8.3.1/solr-8.3.1.tgz && tar xvf solr-8.3.1.tgz


