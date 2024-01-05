# Lambda_Glue_DynamoDB_ETL

ETL use case

This pipeline demonstrate the use of AWS Lambda, Glue, Redshift, SNS to build a sample ETL process to upload data into AWS DynamoDB so that it's available for use in 

Figure below represents the infrastructure resources we provision for Data Lake.

1. We generate a data for employees of a company like Name, Title, Department, Salary etc and other details
   
2. We upload our file to S3 raw bucket of the data lake. Here file server is a data producer/source for the data lake. Assumption is the data will be pushed to the raw bucket

3. We create an S3 trigger for our desired bucket in S3. It can be done either via AWS Console or by running a shell script to auto generate the event notification.

4. Amazon S3 triggers an event notification to AWS Lambda Function as soon as this data is uploaded

5. When data is uploaded some transformations are made on the table like 
  
6. AWS Lambda function inserts an item in DynamoDB table. 
   
7. Updates DynamoDB table with job status

8. Sends SNS notification
