# Common steps

Both solutions relly on Vagrant and VirtualBox to spin up a VMs hence we must install them first.

I am using scoop package manager on Windows, so example code is:

```
scoop bucket add nonportable
scoop bucket add main

scoop install virtualbox-np
scoop install vagrant
```





# Steps Solution Task 1

1. Spin up the VM using vagran

```
pwd
## Path
## ----
## C:\Users\ivan\Documents\repos\DevOps-SoftUni-2022\02_Ansible\Solution_Task_01

vagrant up
vagrant ssh ansible
```

Once that is done, we will have two VM, we need to SSH into the first

2. Initialize and run Ansible

```
cd /vagrant

## Install all needed roles and collections
ANSIBLE_CONFIG=./ansible.cfg ansible-galaxy install -r requirements.yml --force

## RUN PLAYBOOK
ANSIBLE_CONFIG=./ansible.cfg ansible-playbook playbook.yml
```

We wait for the apply to complete, once it's done the output should look like:

```
PLAY RECAP ****************************************************************************************************************************
web                        : ok=19   changed=11   unreachable=0    failed=0    skipped=11   rescued=0    ignored=0
```

You could go to the of your web vm http://192.168.150.101/ (remember this is hardcoded in the Vagrantfile) and you would see the default nginx welcome screen.

![image-20221209234052124](image-20221209234052124.png)

### EASTER EGG INCLUDED, if you want to see it, you must change the playbook.yml file, specifically the variables `install_easter_egg`


# Steps Solution Task 2



Solution 2 has a mix between local and remote roles.

Additionally I have not made any of the hardcoded values of the database dynamic, I have made the assumption that this is a "backup" copy and hence it just needs to be deployed. In order to do that we must:

1. Spin up the VM using vagran

```
pwd
## Path
## ----
## C:\Users\ivan\Documents\repos\DevOps-SoftUni-2022\02_Ansible\Solution_Task_02

vagrant up
vagrant ssh ans
```

Once that is done, we will have two VM, we need to SSH into the first

2. Initialize and run Ansible

```
cd /vagrant

## Install all needed roles and collections
ANSIBLE_CONFIG=./ansible.cfg ansible-galaxy install -r requirements.yml --force

## RUN PLAYBOOK
ANSIBLE_CONFIG=./ansible.cfg ansible-playbook playbook.yml
```

We wait for the apply to complete, once it's done the output should look like:

```
PLAY RECAP ********************************************************************************************************************************
db                         : ok=8    changed=4    unreachable=0    failed=0    skipped=2    rescued=0    ignored=0
web                        : ok=50   changed=3    unreachable=0    failed=0    skipped=17   rescued=0    ignored=0
```

You could go to the of your web vm http://192.168.150.111/ (remember this is hardcoded in the Vagrantfile) and you would see the default nginx welcome screen.

![image-20221212222817948](image-20221212222817948.png)