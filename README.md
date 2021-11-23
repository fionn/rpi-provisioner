# Provision a Raspberry Pi

## About

This is an opinionated playbook for my personal Pi.

## Prerequisites

### Local

Install `ansible-stow` with `ansible-galaxy install -r requirements.yml`.
We also require `collections.general` and `sshpass` locally.

Add the Pi to the `~/.ssh/config` hosts.

### Remote

Install Arch Linux ARM.

SSH to the target and run
```
pacman-key --init
pacman-key --populate archlinuxarm
pacman -Sy python sudo
visudo  # to add wheel to the sudoers file
```
as root (required to bootstrap Ansible).

Test inventory and connectivity with `ansible -i hosts.ini all -m ping`.

## Provision

```
ansible-playbook playbook.yml --vault-password-file vault_password.txt -i hosts.ini
```
