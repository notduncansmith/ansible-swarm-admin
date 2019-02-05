# ansible-swarm-admin

This repository contains:
  - A Dockerfile that installs Ansible onto an Alpine Linux base and mounts a volume for inventory and playbooks

  - Script to build this image and run playbooks by name

  - Playbook to set up base nodes

  - Playbooks to start/join Docker Swarm clusters

  - A `secrets.yml` file managed by Ansible Vault

```sh
./build-image # Build the ansible-admin image
./run-playbook # Run the default "hello" playbook
./run-playbook hello # Run ./playbooks/hello.yml
```