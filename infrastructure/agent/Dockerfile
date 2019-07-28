# Pull from golang alpine because installing golang on alpine is painful
FROM golang:alpine

# Assume root access for all commands
USER root

WORKDIR /root

# Install a number of useful tools
RUN apk update && \
    apk add curl unzip python3 sudo bash wget

# Install aws cli
RUN curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip" && \
    unzip awscli-bundle.zip && \
    sudo python3 awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws

# Install packer
RUN curl "https://releases.hashicorp.com/packer/1.4.2/packer_1.4.2_linux_amd64.zip" -o "packer.zip" && \
    mkdir -p /usr/local/packer && \
    unzip packer.zip -d /usr/local/packer && \
    rm packer.zip && \
    cd /usr/bin && \
    ln -s /usr/local/packer/packer packer

# Install terraform
RUN curl "https://releases.hashicorp.com/terraform/0.12.5/terraform_0.12.5_linux_amd64.zip" -o "tf.zip" && \
    mkdir -p /usr/local/terraform && \
    unzip tf.zip -d /usr/local/terraform && \
    rm tf.zip && \
    cd /usr/bin && \
    ln -s /usr/local/terraform/terraform terraform

# Install terragrunt
RUN wget "https://github.com/gruntwork-io/terragrunt/releases/download/v0.19.11/terragrunt_linux_amd64" -O "terragrunt" && \
    mkdir -p /usr/local/terragrunt && \
    mv terragrunt /usr/bin/terragrunt && \
    chmod +x /usr/bin/terragrunt
