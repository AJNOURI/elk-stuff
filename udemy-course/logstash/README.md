Example of JSON datasource:
http://ikeptwalking.com/elasticsearch-sample-data/

wget http://ikeptwalking.com/wp-content/uploads/2017/04/Employees100K.zip
unzip Employees100K.zip

Copy the unzipped JSON file into your working directory

Set companydatabase index schema:
curl -XPUT 'localhost:9200/companydatabase?pretty' -H 'Content-Type: application/json' -d' {"mappings" : { "employees" : { "properties" : { "FirstName" : { "type" : "text"  }, "LastName" : { "type" : "text"  }, "Designation" : { "type" : "text"  }, "Salary" : { "type" : "integer"  }, "DateOfJoining" : { "type" : "date", "format": "yyyy-MM-dd"  }, "Address" : { "type" : "text"  }, "Gender" : { "type" : "text"  }, "Age" : { "type" : "integer"  }, "MaritalStatus" : { "type" : "text"  }, "Interests" : { "type" : "text"  } } } }}'


Index JSON file into elasticsearch:
curl -XPOST 'http://0.0.0.0:9200/_bulk' --data-binary Emplyees100K.json

