From python:3.7

WORKDIR /

COPY requeriments.txt ./

RUN pip install --no-cache-dir -r requeriments.txt

RUN curl -Os https://releases.hashicorp.com/packer/1.3.3/packer_1.3.3_linux_amd64.zip

RUN unzip packer_1.3.3_linux_amd64.zip 
RUN mv packer /usr/local/bin/ 
RUN rm packer_1.3.3_linux_amd64.zip