#!/bin/sh

read -p "Enter aws profile, press enter for [default]: " name
profile=${name:-default}

STACKNAME="wiremock"
REGION="eu-west-1"

aws cloudformation delete-stack --profile $profile --region $REGION --stack-name $STACKNAME