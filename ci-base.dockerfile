### comes with docker, gcloud and kubectl ###
FROM google/cloud-sdk:190.0.1

### helm
ENV HELM_VERSION=v2.8.2
RUN curl -L http://storage.googleapis.com/kubernetes-helm/helm-${HELM_VERSION}-linux-amd64.tar.gz | tar zxv -C /tmp \
  && mv /tmp/linux-amd64/helm /bin/helm && helm version --client

### NODE ###
RUN   curl -sL https://deb.nodesource.com/setup_8.x | bash - && \ 
  apt-get update && apt-get install -y nodejs build-essential && node --version

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
   apt-get update && apt-get install yarn && yarn --version

# ### node based apps ###
RUN yarn global add \
  lerna
