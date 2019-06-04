FROM nanusefue/aws-tools

RUN aws configure set profile.dev.aws_access_key_id XXXXXXXXX
RUN aws configure set profile.dev.aws_secret_access_key XXXXXXXX
RUN aws configure set profile.dev.region eu-west-1
