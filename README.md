
#ANSIBLE
docker run -v "$(pwd)/files/playbook:/files/playbook/" -v "$(pwd)/files/output:/files/output/"   aws-docker-tools ansible-playbook /files/playbook/ec2.yml

#CLOUDFORMATION
docker run -v "$(pwd)/files:/files" aws-docker-tools python files/cloudformation/ec2.py > files/output/ec2.json

#PACKER
docker run -v "$(pwd)/files:/files" -v "$(pwd)/files/output:/files/output"   aws-docker-tools packer
