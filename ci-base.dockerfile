### comes with docker and gcloud ###
FROM google/cloud-sdk:190.0.1

### NODE ###
RUN   curl -sL https://deb.nodesource.com/setup_8.x | bash - && \ 
  apt-get update && apt-get install -y nodejs build-essential && node --version

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
   apt-get update && apt-get install yarn && yarn --version

# ### node based apps ###
RUN yarn global add \
  lerna
