# Wiremock on elastic beanstalk

Need a wiremock instance?  
Set it up using this cloudformation template!


## Getting started
Update the BucketName in `deploy.sh` and `update.sh` to the name of the bucket you which to create and use for this project.

## Deploy
Create the stack by running the following command.  
`./deploy.sh`

## Update
`./update.sh`

## Outputs
The stack outputs the wiremock URLs pointing to the admin console.
Will be something like:
`http://awseb-e-u-AWSEBLoa-156X2H7XR44UD-1378767710.eu-west-1.elb.amazonaws.com/__admin`

You can find the outputs, eg. the `/requests` endpoint.

`aws cloudformation --region eu-west-1 describe-stacks --stack-name wiremock --query "Stacks[0].Outputs[?OutputKey=='WiremockMappingsURL'].OutputValue" --output text`

## Set up a mock


## Resources
* [https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/quickref-elasticbeanstalk.html](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/quickref-elasticbeanstalk.html)
* [http://wiremock.org/docs/running-standalone/](http://wiremock.org/docs/running-standalone/)
* [https://github.com/juxt/edge/blob/master/examples/cloudformation/elasticbeanstalk/stack.yaml](https://github.com/juxt/edge/blob/master/examples/cloudformation/elasticbeanstalk/stack.yaml)