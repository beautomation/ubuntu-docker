FROM node:14-alpine

COPY entrypoint.sh /entrypoint.sh

# Install packages
RUN apk update && apk add --update --no-cache \
    git \
    bash \
    curl \
    openssh \
    python3 \
    py3-pip \
    py-cryptography \
    wget \
    curl

RUN apk --no-cache add --virtual builds-deps build-base python3

# Update NPM
RUN npm config set unsafe-perm true


# Install AWSCLI
RUN pip install --upgrade pip && \
    pip install --upgrade awscli

ENTRYPOINT ["/entrypoint.sh"]