FROM python

# Azure CLI
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

# Terraform
RUN apt-get install wget unzip && \
    export VER="0.11.13" && \
    wget https://releases.hashicorp.com/terraform/${VER}/terraform_${VER}_linux_amd64.zip && \
    unzip terraform_${VER}_linux_amd64.zip && \
    mv terraform /usr/local/bin/ && \
    which terraform

COPY Dockerfile /cnab/Dockerfile
COPY app /cnab/app

CMD ["/cnab/app/run"]