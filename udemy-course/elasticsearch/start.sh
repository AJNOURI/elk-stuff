docker run -ti --rm --name logstash --hostname logstash -v "$PWD"/config-dir:/mylogstash/config-dir -v "$PWD"/data:/mylogstash/data mylogstach bash
