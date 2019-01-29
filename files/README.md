
#ANSIBLE
docker run -v "$(pwd)/files/playbook:/files/playbook/" -v "$(pwd)/files/output:/files/output/"  aws-docker ansible-playbook /files/playbook/ec2.yml

#CLOUDFORMATION
docker run -v "$(pwd)/files:/files" -v "$(pwd)/files/output:/files/output"  aws-docker python files/example.py

#PACKER
docker run -v "$(pwd)/files:/files" -v "$(pwd)/files/output:/files/output"  aws-docker packer
