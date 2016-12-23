# realtime-firehose-athena

This is a demo code for implementation of realtime analytics data platform on top of Amazon Kinesis firehos, Lambda and Athena. 

1) Data Source - AWS VPC flow logs is being used for demostration. So you need to incorperate the VPC flow logs onto AWS CloudWatch logs.
2) Then set up a real-time processiong of cloudwatch logs via lambda - see this guide for details - http://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/Subscriptions.html 
3) Create a lambda function by utilizing the lambda code attached in lambda directory. Ensure you have necessary lambda permissions. http://docs.aws.amazon.com/lambda/latest/dg/welcome.html
4) Create a kinesis firehose stream to ingest the data onto S3. http://docs.aws.amazon.com/firehose/latest/dev/basic-create.html#console-to-s3
5) Create a hive table from Athena console and then query the data from S3. http://docs.aws.amazon.com/athena/latest/ug/creating-tables.html 
