# Wiremock on elastic beanstalk

Need a wiremock instance?  
Set it up using this cloudformation template!

## Deploy
Create the stack by running the following command.  
`./deploy.sh`

The stack outputs the wiremock URLs pointing to the admin console.


## Update
`./update.sh`

## Resources
* [https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/quickref-elasticbeanstalk.html](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/quickref-elasticbeanstalk.html)
* [http://wiremock.org/docs/running-standalone/](http://wiremock.org/docs/running-standalone/)
* [https://github.com/juxt/edge/blob/master/examples/cloudformation/elasticbeanstalk/stack.yaml](https://github.com/juxt/edge/blob/master/examples/cloudformation/elasticbeanstalk/stack.yaml)