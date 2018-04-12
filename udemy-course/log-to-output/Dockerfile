FROM logstash

RUN apt update && apt install vim
RUN mkdir /config-dir
RUN mkdir /data
COPY access_log_20180411-100122.log /data/apache_access.log
COPY logstash.conf /config-dir/logstash.conf

#CMD ["-f", "/some/config-dir/logstash.conf"]
