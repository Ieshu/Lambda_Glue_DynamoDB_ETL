# Replace these variables with your own values
bucket_name="ieshaan-bucket-latest"
lambda_function_arn="arn:aws:lambda:us-west-2:935670829844:function:glue_dynamo_trigger"
region_name="us-west-2"

# Define the notification configuration
notification_config=$(cat <<EOF
{
  "LambdaFunctionConfigurations": [
    {
      "LambdaFunctionArn": "${lambda_function_arn}",
      "Events": ["s3:ObjectCreated:*"]
    }
  ]
}
EOF
)

# Use AWS CLI to set the notification configuration
aws s3api put-bucket-notification-configuration \
    --bucket "${bucket_name}" \
    --notification-configuration "${notification_config}"

echo 'S3 event notification configured'
