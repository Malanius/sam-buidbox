FROM python:3

LABEL maintainer="malaniusprivierre@gmail.com"
LABEL version="1.0.0"

RUN pip install --upgrade awscli aws-sam-cli
