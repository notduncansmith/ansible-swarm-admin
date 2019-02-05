# ansible-swarm-admin

This repository contains:
  - A Dockerfile that installs Ansible onto an Alpine Linux base and mounts a volume for inventory and playbooks

  - Scripts to build this image, run playbooks by name, and manage secrets

  - Playbook to set up base nodes

  - Playbooks to start/join Docker Swarm clusters

  - A `secrets.yml` file managed by Ansible Vault (password is `password`)

## Setup

Generate a new admin key: `ssh-keygen -t ed25519 -f ./admin_key`. Make sure your `admin_key` file is in this directory when you run commands.

Make sure the `inventory.yml` file contains your actual node IP addresses, and these addresses will allow you to SSH in as root with `./admin_key`.

Rekey the secrets file **as soon as you start a project** (see below).

## Usage

```sh
./build-image # Build the ansible-admin image

./run-playbook # Run the default "hello" playbook
./run-playbook hello # Run ./playbooks/hello.yml

./edit-secrets # Modify encrypted contents of ./secrets.yml
./rekey-secrets # Re-encrypt contents of ./secrets.yml with a new password

./add-host 127.0.0.1 # Scan a host's public keys and add them to known_hosts (to avoid being prompted during SSH authentication)
```

