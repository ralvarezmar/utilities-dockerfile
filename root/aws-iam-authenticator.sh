#!/bin/sh

curl -o aws-iam-authenticator https://amazon-eks.s3.us-west-2.amazonaws.com/1.16.8/2020-04-16/bin/linux/amd64/aws-iam-authenticator \
    && curl -o aws-iam-authenticator.sha256 https://amazon-eks.s3.us-west-2.amazonaws.com/1.16.8/2020-04-16/bin/linux/amd64/aws-iam-authenticator.sha256 \
    && hash=$(cat aws-iam-authenticator.sha256 | awk '{ print$1 }') \
    && openssl sha1 -sha256 aws-iam-authenticator | grep -q "${hash}" \
    && chmod +x ./aws-iam-authenticator \
    && mv ./aws-iam-authenticator /usr/local/bin/
