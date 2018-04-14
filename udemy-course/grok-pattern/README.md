
## read from a log file and parse to output

### Prepare logstash pipeline file (ex: pipelines.conf)
### Edit your Dockerfile if needed:

    FROM logstash
    
    RUN apt update && apt install vim -y
    RUN mkdir -p /mylogstash/config-dir
    RUN mkdir /mylogstash/data
    

### Build the image

    docker build -t mylogstach .

### Run container console 

    docker run -ti --rm --name logstash --hostname logstash -v "$PWD"/config-dir:/mylogstash/config-dir -v "$PWD"/data:/mylogstash/data mylogstach bash

Or run docker-compose to start logstash bash console:

    version: '3'
    services:
        mylogstash:
            build:
                context: .
                dockerfile: Dockerfile
            volumes:
                - ./config-dir:/mylogstash/config-dir:rw
                - ./data:/mylogstash/data:rw
            ports:
                - "5000:5000"
            tty: true
            command: ["bash"]


### Within logstash container, start logstash with the correct pipeline file

    logstash -f /mylogstash/config-dir/pipelines.conf --config.reload.automatic

### To reparse the doc from the beginning:
     find /var -type f -name '.sincedb*'
    /var/lib/logstash/plugins/inputs/file/.sincedb_658cd31618ac77269fa793d90b42085f

Remove the file to reparse the data file again:
    
    rm  `find /var -type f -name '.sincedb*'`

