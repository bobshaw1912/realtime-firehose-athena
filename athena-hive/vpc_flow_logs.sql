-- create the hive table for vpc_flow_logs.  The hive partition is made on top of year, month, day, hour
--  because the firehose is streaming the data into S3 the way as partitioned. 
CREATE EXTERNAL TABLE IF NOT EXISTS vpc_flow_logs (
Version INT,
Account STRING,
InterfaceId STRING,
SourceAddress STRING,
DestinationAddress STRING,
SourcePort INT,
DestinationPort INT,
Protocol INT,
Packets INT,
Bytes INT,
StartTime INT,
EndTime INT,
Action STRING,
LogStatus STRING
)
PARTITIONED BY (
year  INT,
month INT,
day   INT,
hour  INT)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.RegexSerDe'
WITH SERDEPROPERTIES (
    "input.regex" = "^([^ ]+)\\s+([0-9]+)\\s+([^ ]+)\\s+([^ ]+)\\s+([^ ]+)\\s+([^ ]+)\\s+([^ ]+)\\s+([^ ]+)\\s+([^ ]+)\\s+([^ ]+)\\s+([0-9]+)\\s+([0-9]+)\\s+([^ ]+)\\s+([^ ]+)$") 
location 's3://your-s3-bucket/year/month/day/hour';
