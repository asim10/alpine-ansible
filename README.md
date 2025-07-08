# Docker-Ansible base image

![version](https://img.shields.io/docker/v/asimd10/alpine-ansible?sort=semver)
[![Docker Pulls](https://img.shields.io/docker/pulls/asimd10/alpine-ansible)](https://hub.docker.com/r/asimd10/alpine-ansible/)
![Docker Image Size](https://img.shields.io/docker/image-size/asimd10/alpine-ansible/latest)
![Docker Stars](https://img.shields.io/docker/stars/asimd10/alpine-ansible)
## Usage

### Run Playbook

```sh
docker run -it --rm \
  -v ${PWD}:/ansible \
  asimd10/alpine-ansible:latest \
  ansible-playbook -i inventory playbook.yml
```
