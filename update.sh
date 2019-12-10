#!/bin/sh

read -p "Enter aws profile, press enter for [default]: " name
profile=${name:-default}

# IMPORTANT: Bucket names must be globally unique across all AWS users.
BUCKET="wiremock-elastic-beanstalk"
REGION="eu-west-1"
STACKNAME="wiremock"


#update stack
echo "Updating stack"
aws cloudformation update-stack --profile $profile --region $REGION --stack-name $STACKNAME --template-body file://./template.yaml \
--parameters ParameterKey=S3Bucket,ParameterValue=$BUCKET ParameterKey=S3Key,ParameterValue=wiremock.zip