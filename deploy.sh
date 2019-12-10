#!/bin/sh

read -p "Enter aws profile, press enter for [default]: " name
PROFILE=${name:-default}

# IMPORTANT: Bucket names must be globally unique across all AWS users.
BUCKET="wiremock-elastic-beanstalk"
REGION="eu-west-1"
STACKNAME="wiremock"

echo "Deploying with parameters: profile=${PROFILE}, bucket=${BUCKET}"

curl http://repo1.maven.org/maven2/com/github/tomakehurst/wiremock-standalone/2.25.1/wiremock-standalone-2.25.1.jar --output wiremock.jar

# Create your deployment bucket if it doesn't exist yet.
aws s3 mb s3://$BUCKET --profile $PROFILE

# Create zip deployment package
zip wiremock.zip wiremock.jar Procfile

# Upload jar to S3
echo "Uploading package to S3Bucket"
aws s3api put-object --bucket wiremock-elastic-beanstalk --key wiremock.zip --body wiremock.zip

# Create cloudformation stack
echo "Creating stack"
aws cloudformation create-stack --profile $PROFILE --region $REGION --stack-name $STACKNAME --template-body file://./template.yaml \
--parameters ParameterKey=S3Bucket,ParameterValue=$BUCKET ParameterKey=S3Key,ParameterValue=wiremock.zip
