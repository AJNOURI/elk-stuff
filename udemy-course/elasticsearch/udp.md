### tcp/udp input plugin

$ cat pipelines.conf
input {
    tcp {
        port => 5000
        type => tcp_message
    }
    udp {
        port => 5001
        type => udp_message
    }
}
filter {
    grok {
    match => [ "message", "%{WORD:firstname} %{WORD:lastname} %{NUMBER:salary}" ]
    }
}
    

output {
    stdout {
        codec => rubydebug
    }
}


### Send data through udp socket 5000

$ echo "Albert Pinto 3000" | netcat 127.0.0.1 5000
$ echo "John Does 2600" | netcat 127.0.0.1 5000



