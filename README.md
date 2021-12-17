# Provision a Raspberry Pi

## About

An opinionated playbook for my personal Pi.

## Prerequisites

### Local

We require `sshpass` and Ansible's `collections.general`.

Add the target to the `~/.ssh/config` hosts.

### Remote

Install Arch Linux ARM.

SSH to the target and run
```bash
pacman-key --init
pacman-key --populate archlinuxarm
pacman -Sy python sudo
visudo  # and add wheel to the sudoers file
```
as root (required to bootstrap Ansible).

Test inventory and connectivity with `ansible -i hosts.ini all -u $user -m ping`.

## Provision

```bash
ansible-playbook playbook.yml --vault-password-file vault_password.txt -i hosts.ini
```

## Recover Secrets

```bash
cat playbook.yml | yq -r .[0].roles[0].vars.password_string | ansible-vault decrypt --vault-password-file vault_password.txt
```
to recover the user's password, for example.
