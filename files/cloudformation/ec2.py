import json
from troposphere import Ref, Template
import troposphere.ec2 as ec2
t = Template()
instance = ec2.Instance("myinstance")
instance.ImageId = "ami-d834aba1"
instance.InstanceType = "t2.micro"
t.add_resource(instance)
print(t.to_json())
f=open('../output/ec2.json', 'w')
f.write(t.to_json())