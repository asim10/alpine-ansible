# Docker-Ansible base image

![version](https://img.shields.io/docker/v/asimd10/alpine-ansible?sort=semver)
[![Docker Pulls](https://img.shields.io/docker/pulls/asimd10/alpine-ansible)](https://hub.docker.com/r/asimd10/alpine-ansible/)
![Docker Image Size](https://img.shields.io/docker/image-size/asimd10/alpine-ansible/latest)
![Docker Stars](https://img.shields.io/docker/stars/asimd10/alpine-ansible)

### Component Details

| Component       | version    |
|-----------------|------------|
| Apline          | 3.21       |
| ANSIBLE         | 10.7.0     |
| ANSIBLE_CORE    |  2.17.7    |
| ANSIBLE_LINT    |  25.6.0    |

## Usage

### Run Playbook

```sh
docker run -it --rm \
  -v ${PWD}:/ansible \
  asimd10/alpine-ansible:latest \
  ansible-playbook -i inventory playbook.yml
```
