# ilab-catalog
[Ansible](https://docs.ansible.com) scripts for automatic deployment of I-lab Catalog.

## Requirements
### Control machine requirements
* [Ansible](https://docs.ansible.com/ansible/intro_installation.html) (>= 2.4)
* [VirtualBox](https://www.virtualbox.org/manual/ch02.html) (>= 5.1)
* [Vagrant](https://www.vagrantup.com/docs/installation/) (>= 1.9)

### Managed node requirements
* [CentOS](https://www.centos.org/) (>= 7.3)

## Deploying I-lab Catalog development instance

Configure the virtual machine for development:
```bash
vagrant up
```

On a Windows host first SSH into the Ansible controller virtual machine (skip this step on GNU/Linux or macOS):
```bash
vagrant ssh ilab-catalog-controller
cd ~/ilab-catalog
```

Deploy I-lab Catalog to development virtual machine:
```bash
ansible-playbook playbook.yml
```

Add following host to /etc/hosts (GNU/Linux or macOS) or %SystemRoot%\System32\drivers\etc\hosts (Windows):
```
192.168.70.10 ilab-catalog.ckan.test
```

## Upgrading I-lab Catalog instance
Upgrading the I-lab Catalog development instance to the latest version can be done by running the Ansible playbooks again.

On a Windows host first SSH into the Ansible controller virtual machine (skip this step on GNU/Linux or macOS):
```bash
vagrant ssh controller
cd ~/ilab-catalog
```

Upgrade Ansible scripts:
```bash
git pull
```

Upgrade I-lab Catalog instance:
```bash
ansible-playbook playbook.yml
```

## License
This project is licensed under the GPL-v3 license.
The full license can be found in [LICENSE](LICENSE).
