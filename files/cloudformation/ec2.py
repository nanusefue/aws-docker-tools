import json
from troposphere import Ref, Template
import troposphere.ec2 as ec2
t = Template()
instance = ec2.Instance("ec2user")
instance.ImageId = "ami-d834aba1"
instance.InstanceType = "t3.micro"
t.add_resource(instance)
print(t.to_json())