FROM quay.io/operator-framework/ansible-operator:v0.17.1

COPY requirements.yml ${HOME}/requirements.yml
RUN ansible-galaxy collection install -r ${HOME}/requirements.yml \
 && chmod -R ug+rwx ${HOME}/.ansible

COPY watches.yaml ${HOME}/watches.yaml

COPY roles/ ${HOME}/roles/

COPY playbooks/playbook_prdauth.yml ${HOME}/playbook_prdauth.yml
COPY playbooks/playbook_prdapp.yml ${HOME}/playbook_prdapp.yml
