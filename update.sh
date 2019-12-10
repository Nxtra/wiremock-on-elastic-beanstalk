#!/bin/sh

read -p "Enter aws profile, press enter for [default]: " name
profile=${name:-default}


read -p "Enter your bucketName: " bucket
BUCKET=${bucket:-wiremock-elastic-beanstalk}


#update stack
echo "Updating stack"
aws cloudformation update-stack --profile $profile --stack-name wiremock --template-body file://./template.yaml \
--parameters ParameterKey=S3Bucket,ParameterValue=$BUCKET ParameterKey=S3Key,ParameterValue=wiremock.zip