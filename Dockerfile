FROM alpine:3.7

# Install Ansible dependencies
RUN apk add --no-cache build-base gcc git libffi-dev musl-dev \
sshpass openssl-dev \
python python-dev py-pip

# Install Ansible
RUN pip install --upgrade pip
RUN pip install ansible

# Mount
VOLUME /var/ops
WORKDIR /var/ops
ENV playbook hello
CMD ansible-playbook -i /var/ops/inventory.yml /var/ops/playbooks/${playbook}.yml