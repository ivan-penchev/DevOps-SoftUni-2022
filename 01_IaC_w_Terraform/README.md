# Steps Solution Task 1

Solution 1 rellies on Vagrant and VirtualBox to spin up a VM.

1. Install Vagrant and VirtualBox

I am using scoop package manager on Windows, so example code is:

```
scoop bucket add nonportable
scoop bucket add main

scoop install virtualbox-np
scoop install vagrant
```

2. Spin up the VM using vagran

   ```
   vagrant up
   ```

   You have to wait until the final step is completed. The final step is part of the startup script that is provided inline in the Vagrantfile, so it ends with docker restart. Like so:

   ```
       docker: * Add vagrant user to docker group ...
       docker: * Adjust Docker configuration ...
       docker: * Restart Docker ...
   ```

   Once that is done, we have a Docker service running on a remote host, and since in the Vagrant file we have hardocoded the IP address to 192.168.99.100 we also know where it is located.

3.  Initialize and Apply terraform

   ```
   terraform init
   terraform apply -auto-approve
   ```

   Now since we know that the host IP would be static, it's also hardcoded in the terraform.tfvars file, but in theory you could change it to any host that runs a docker socket, just by adjusting the vm_host variable.

   We wait for the apply to complete, once it's done the output should look like:

   ```
   Apply complete! Resources: 5 added, 0 changed, 0 destroyed.
   
   Outputs:
   
   docker_image_db_installed = "sha256:ab68ccbe63562025e83fe29d772c3cd9e7993aed5703bbf8e5594fe1498e5038"
   docker_image_web_installed = "sha256:13c670055a4de9207c32c006e894666c929d524effe285b3e58c455fc3acce6e"
   web_application_url = "http://192.168.99.100:8000"
   ```

   You could go to the adress and you should see something like:

   ![image-20221205170935167](.\image-20221205170935167.png)

# Steps Solution Task 2

Solution 2 rellies on Azure, so you must be able to create your own service principle and fill it out in the terraform.tfvars file.



1. Fill out Azure SP for provider

In order to do that you must edit the following variables inside terraform.tfvars file:

```
subscription_id = "insert-guid-subscription-id"
tenant_id       = "insert-guid-tenant-id"
client_id       = "insert-guid-client-id"
client_secret   = "insert-string-client-secret"
```

2. Initialize and Apply terraform

```
terraform init
terraform apply -auto-approve
```

We wait for the apply to complete, once it's done the output should look like:

```
Apply complete! Resources: 15 added, 0 changed, 0 destroyed.

Outputs:

database_public_ip = "http://20.86.102.249"
vms_private_ips = [
  "10.0.2.5",
  "10.0.2.4",
]
webserver_public_ip = "http://20.105.202.209"
```

Afterward we could just enter the webserver public IP and we should see something like:

![image-20221205173000917](.\image-20221205173000917.png)