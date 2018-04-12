
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
    filter {
        grok {
            #match => {"message" => "%{IP:ip_address} %{USER:identity} %{USER:auth} \[%{HTTPDATE:req_ts}\] \"%{WORD:http_verb} %{URIPATHPARAM:req_path}\""}
            match => { "message" => "%{COMBINEDAPACHELOG}"  }
        }
    }    
    output {
        stdout {
                codec => rubydebug
                    
        }
    
    }



cat Dockerfile

    FROM logstash
    
    RUN apt update && apt install vim -y
    RUN mkdir -p /mylogstash/config-dir
    RUN mkdir /mylogstash/data
    
    #CMD ["-f", "/some/config-dir/logstash.conf"]


### Build the image

    docker build -t mylogstach .

### Run container console 

    cat start.sh 
    docker run -ti --rm --name logstash --hostname logstash -v "$PWD"/config-dir:/mylogstash/config-dir -v "$PWD"/data:/mylogstash/data mylogstach bash

Start the file

    bash start.sh

### Start logstash with the correct pipeline file

    logstash -f /mylogstash/config-dir/pipelines.conf --config.reload.automatic

### To reparse the doc from the beginning:
     find /var -type f -name '.sincedb*'
    /var/lib/logstash/plugins/inputs/file/.sincedb_658cd31618ac77269fa793d90b42085f

Remove the file
    
    rm  `find /var -type f -name '.sincedb*'`

now, the data file will be reparsed.
