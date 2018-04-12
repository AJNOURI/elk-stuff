
## read from a log file and parse to output

### Prepare logstash pipeline file

    input {
        file {
                path => "/data/apache_access.log"
                start_position => "beginning"
        }
        http {
    
        }
    
    }
    
    output {
        stdout {
                codec => rubydebug
                    
        }
    
    }



cat Dockerfile

    FROM logstash
    
    RUN apt update && apt install vim
    RUN mkdir /config-dir
    RUN mkdir /data
    COPY apache_access.log /data/apache_access.log
    COPY pipelines.conf /config-dir/pipelines.conf
        
    #CMD ["-f", "/some/config-dir/logstash.conf"]

### Build the image

    docker build -t mylogstach .

### start the container console 

    docker run -ti --name logstash --hostname logstash mylogstach bash

### start logstash with the correct pipeline file

    logstash -f /config-dir/pipelines.conf --config.reload.automatic

