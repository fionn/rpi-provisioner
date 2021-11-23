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
```
pacman-key --init
pacman-key --populate archlinuxarm
pacman -Sy python sudo
visudo  # and add wheel to the sudoers file
```
as root (required to bootstrap Ansible).

Test inventory and connectivity with `ansible -i hosts.ini all -u $user -m ping`.

## Provision

```
ansible-playbook playbook.yml --vault-password-file vault_password.txt -i hosts.ini
```
