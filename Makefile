PLAYBOOK=playbook.yml
export ANSIBLE_VAULT_PASSWORD_FILE=vault_password.txt

.PHONY: playbook
playbook:
	ansible-playbook $(PLAYBOOK) --vault-password-file $(ANSIBLE_VAULT_PASSWORD_FILE) -i hosts.ini

.PHONY: yamllint
yamllint:
	find . -name "*.yml" -print -exec $@ '{}' +

.PHONY: ansible-lint
ansible-lint:
	$@ $(PLAYBOOK)

.PHONY: lint
lint: yamllint ansible-lint
