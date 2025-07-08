# pull base image
FROM alpine:3.21

ARG ANSIBLE_VERSION=10.7.0
ARG ANSIBLE_CORE_VERSION=2.17.7
ARG ANSIBLE_LINT=25.6.0

# Labels.
LABEL maintainer="Asim Dinda <asimd1993@gmail.com>" \
    org.label-schema.schema-version="1.0" \
    org.label-schema.description="Ansible on Alpine image for Container" \
    org.label-schema.url="https://github.com/asim10/alpine-ansible"

RUN apk --no-cache add \
        sudo \
        python3\
        py3-pip \
        openssl \
        ca-certificates \
        sshpass \
        openssh-client \
        rsync \
        jq \
        curl \
        curl \
        busybox-extras \
        git && \
    apk --no-cache add --virtual build-dependencies \
        python3-dev \
        libffi-dev \
        musl-dev \
        gcc \
        cargo \
        build-base && \
    find /usr/lib/python* -name "EXTERNALLY-MANAGED" -exec rm {} \; && \
    pip3 install --upgrade pip wheel && \
    pip3 install --upgrade cryptography cffi pywinrm && \
    pip3 install ansible-core==${ANSIBLE_CORE_VERSION} ansible==${ANSIBLE_VERSION} ansible-lint==${ANSIBLE_LINT} && \
    pip3 install mitogen jmespath && \
    pip3 install hvac google-auth beautifulsoup4 && \
    apk del build-dependencies && \
    rm -rf /var/cache/apk/* && \
    rm -rf /root/.cache/pip && \
    rm -rf /root/.cargo

RUN mkdir /ansible && \
    mkdir -p /etc/ansible && \
    echo 'localhost' > /etc/ansible/hosts

WORKDIR /ansible

CMD [ "ansible-playbook", "--version" ]
