FROM alpine:3.7

# Install Ansible dependencies
RUN apk add --no-cache build-base gcc git libffi-dev musl-dev \
sshpass openssl-dev openssh-client \
python python-dev py-pip

# Install Ansible
RUN pip install --upgrade pip
RUN pip install ansible
RUN mkdir /etc/ansible && mkdir -p /root/.ansible/cp
COPY ./.ansible.cfg /etc/ansible/ansible.cfg

# Set up SSH
COPY --chown=root known_hosts /etc/ssh/ssh_known_hosts

# Mount ops volume
VOLUME /var/ops
WORKDIR /var/ops

ENV playbook hello
CMD ansible-playbook -i /var/ops/inventory.yml /var/ops/playbooks/${playbook}.yml --ask-vault-pass