# Wiremock on elastic beanstalk

Need a wiremock instance?  
Set it up using this cloudformation template!


## Getting started guide
Update the BucketName in `deploy.sh` and `update.sh` to the name of the bucket you which to create and use for this project.
Update the region if necessary.

### Deploy
Create the stack by running the following command.  
`./deploy.sh`

You successfully setup your wiremock!

![success](.images/light.png)

### Update
`./update.sh`


## More
### Outputs
The stack outputs the wiremock URLs pointing to the admin console.
Will be something like:
`http://awseb-e-u-AWSEBLoa-156X2H7XR44UD-1378767710.eu-west-1.elb.amazonaws.com/__admin`

You can find the outputs, eg. the `/requests` endpoint.

`aws cloudformation --region eu-west-1 describe-stacks --stack-name wiremock --query "Stacks[0].Outputs[?OutputKey=='WiremockMappingsURL'].OutputValue" --output text`

### Set up a stubs

You can now setup a stub.
Update the URL in the `setup-stub.sh` and `test-stub.sh` with your own mappingURL and baseURL found in the outputs of the stack (or command above).

```
cd stubbing
./setup-stub.sh
./test-stub.sh
```

## Resources
* [https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/quickref-elasticbeanstalk.html](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/quickref-elasticbeanstalk.html)
* [http://wiremock.org/docs/running-standalone/](http://wiremock.org/docs/running-standalone/)
* [https://github.com/juxt/edge/blob/master/examples/cloudformation/elasticbeanstalk/stack.yaml](https://github.com/juxt/edge/blob/master/examples/cloudformation/elasticbeanstalk/stack.yaml)