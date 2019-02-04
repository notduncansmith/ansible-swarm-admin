# ansible-admin

This repository contains:
  - A Dockerfile that installs Ansible onto an Alpine Linux base and mounts a volume for inventory and playbooks

  - Script to build this image and run playbooks by name

  - An example playbook

```sh
./build-image # Build the ansible-admin image
./run-playbook # Run the default "hello" playbook
./run-playbook hello # Run ./playbooks/hello.yml
```