FROM python:3

LABEL maintainer="malaniusprivierre@gmail.com"
LABEL version="1.0.0"

# Replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Basic SAM requirements
RUN pip install --upgrade awscli aws-sam-cli

# Node based lambdas
ENV NODE_VERSION=12.13.0
RUN echo "Starting Javascript..." \
    && git clone https://github.com/nvm-sh/nvm.git /root/.nvm \
    && cd /root/.nvm && git checkout v0.35.3 \
    && . /root/.nvm/nvm.sh \
    && nvm install ${NODE_VERSION} \
    && echo "Done JS!"
ENV NVM_DIR /root/.nvm
ENV NODE_PATH $NVM_DIR/versions/node/v$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH
RUN echo "node:" && node --version
RUN echo "npm:" && npm --version