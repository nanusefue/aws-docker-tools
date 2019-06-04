FROM python:3.7-slim

WORKDIR /

COPY requeriments.txt ./

RUN pip install --no-cache-dir -r requeriments.txt
RUN apt-get update
RUN apt-get install -y curl unzip
RUN curl -Os https://releases.hashicorp.com/packer/1.4.1/packer_1.4.1_linux_amd64.zip

RUN unzip packer_1.4.1_linux_amd64.zip 
RUN mv packer /usr/local/bin/ 
RUN rm packer_1.4.1_linux_amd64.zip