
## read from a log file(s) and parse to elasticsearch


Copy the log file(s) to the directory mapped to logstash.
Change logstash output to the following to redirect the filtered logs to elastic search.

```
output {
    elasticsearch {
        hosts => [ "elasticsearch:9200" ]
        document_type => "default"
        http_compression => true
    }
}
```
Start the trio (Elasticsearch, logstash and Kibana) containers using the docker-compose file:


```
version: '3'
services:
    elasticsearch:
        image: elasticsearch
        ports:
            - "9200:9200"
            - "9300:9300"
        volumes:
            - ./data:/usr/share/elasticsearch/data
    mylogstash:
        build:
            context: .
            dockerfile: Dockerfile
        volumes:
            - ./config-dir:/mylogstash/config-dir:rw
            - ./data:/mylogstash/data:rw
        ports:
            - "5000:5000"
            - "8080:8080"
        tty: true
        command: ["bash"]
        links:
            - elasticsearch
    kibana:
        image: kibana
        ports:
            - "5601:5601"
        links:
            - elasticsearch

```
```
docker-compose up -d
```
Now access logstash container and start logstash:

```
logstash -f /mylogstash/config-dir/pipelines.conf --config.reload.automatic
```

