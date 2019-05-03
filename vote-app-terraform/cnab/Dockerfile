FROM alpine:latest

ENV HELM_LATEST_VERSION="v2.9.1"
ENV TERRAFORM_VERSION=0.11.13

# Add kubectl
ADD https://storage.googleapis.com/kubernetes-release/release/v1.6.4/bin/linux/amd64/kubectl /usr/local/bin/kubectl
RUN chmod +x /usr/local/bin/kubectl

# install helm and azure-cli
RUN apk add --update ca-certificates \
 && apk add --update -t deps wget \
 && wget https://storage.googleapis.com/kubernetes-helm/helm-${HELM_LATEST_VERSION}-linux-amd64.tar.gz \
 && tar -xvf helm-${HELM_LATEST_VERSION}-linux-amd64.tar.gz \
 && mv linux-amd64/helm /usr/local/bin \
 && rm -f /helm-${HELM_LATEST_VERSION}-linux-amd64.tar.gz \
 && apk add bash py-pip \
 && apk add --virtual=build gcc libffi-dev musl-dev openssl-dev python-dev make \
 && pip install --upgrade pip \
 && pip install azure-cli \
 && apk del --purge deps \
 && rm /var/cache/apk/*

# Install Terraform
RUN apk add --update curl \
  && apk add --update jq \
  && apk add --update git \
  && apk add --update unzip && \
  cd /tmp && \
  wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
  unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/bin && \
  wget https://dl.google.com/dl/cloudsdk/channels/rapid/google-cloud-sdk.zip -O /tmp/google-cloud-sdk.zip && \
  cd /usr/local && unzip /tmp/google-cloud-sdk.zip && \
  google-cloud-sdk/install.sh --usage-reporting=false --path-update=true --bash-completion=true && \
  google-cloud-sdk/bin/gcloud config set --installation component_manager/disable_update_check true && \
  rm -rf /tmp/* && \
  rm -rf /var/cache/apk/* && \
  rm -rf /var/tmp/*

COPY Dockerfile /cnab/Dockerfile
COPY app /cnab/app

CMD ["/cnab/app/run"]
