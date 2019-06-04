
## Aws Docker Tools

#### Description

- [Ansible 2.8](https://www.ansible.com/)

Ansible is a universal language, unraveling the mystery of how work gets done. Turn tough tasks into repeatable playbooks. Roll out enterprise-wide protocols with the push of a button.

- [Boto3](https://boto3.amazonaws.com/v1/documentation/api/latest/index.html)

Boto is the Amazon Web Services (AWS) SDK for Python. It enables Python developers to create, configure, and manage AWS services, such as EC2 and S3. Boto provides an easy to use, object-oriented API, as well as low-level access to AWS services.

- [Packer](https://www.packer.io/)

Packer is easy to use and automates the creation of any type of machine image. 

- [Awscli](https://aws.amazon.com/cli/?nc1=h_ls)

The AWS Command Line Interface (CLI) is a unified tool to manage your AWS services. With just one tool to download and configure, you can control multiple AWS services from the command line and automate them through scripts.

- [Awsebcli](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/eb-cli3-install.html)

The Elastic Beanstalk Command Line Interface (EB CLI) is a command line client that you can use to create, configure, and manage Elastic Beanstalk environments.

- [Troposphere](https://github.com/cloudtools/troposphere)

The troposphere library allows for easier creation of the AWS CloudFormation JSON by writing Python code to describe the AWS resources. troposphere also includes some basic support for OpenStack resources via Heat.

Different examples for the use of the following tools

#### ANSIBLE

```bash
docker run -v "$(pwd)/files/playbook:/files/playbook/" \ 
-v "$(pwd)/	files/output:/files/output/" \
aws-docker-tools ansible-playbook /files/playbook/ec2.yml
```

#### CLOUDFORMATION

Structure of the files:

```
files
 cloudformation
  ec2.py
 output
  ec2.json
```

Docker run
```bash
docker run -v "$(pwd)/files:/files" aws-docker-tools python \ 
files/cloudformation/ec2.py > files/output/ec2.json
```

ec2.py

```python
import json
from troposphere import Ref, Template
import troposphere.ec2 as ec2
t = Template()
instance = ec2.Instance("ec2user")
instance.ImageId = "ami-d834aba1"
instance.InstanceType = "t3.micro"
t.add_resource(instance)
print(t.to_json())
```

ec2.json

```json
{
    "Resources": {
	"ec2user": {
	    "Properties": {
	        "ImageId": "ami-d834aba1",
	        "InstanceType": "t3.micro"
	    },
	    "Type": "AWS::EC2::Instance"
	}
    }
}
```

#### PACKER

```bash
docker run -v "$(pwd)/files:/files" -v "$(pwd)/files/output:/files/output" \
aws-docker-tools packer
```