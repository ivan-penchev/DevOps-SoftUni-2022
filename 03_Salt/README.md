# Introduction

Setting Master/Slave relation ship for salt was pain.
I wanted to do a better approach, than having scripts and hardcoding OS, so I decided to use the Vagrant provisionar for Salt.

This initially made Vagrant timeout:

```

   default: SSH address: 127.0.0.1:2222
    default: SSH username: vagrant
    default: SSH auth method: private key
Timed out while waiting for the machine to boot. This means that
Vagrant was unable to communicate with the guest machine within
the configured ("config.vm.boot_timeout" value) time period.

If you look above, you should be able to see the error(s) that
Vagrant had when attempting to connect to the machine. These errors
are usually good hints as to what may be wrong.

If you're using a custom box, make sure that networking is properly
working and you're able to connect to the machine. It is a common
problem that networking isn't setup properly in these boxes.
Verify that authentication configurations are also setup properly,
as well.

If the box appears to be booting properly, you may want to increase
the timeout ("config.vm.boot_timeout") value.

```

after some debugining, literally including `vagrant up --debug` flag, I found multiple errors of type cant getVM method.
Nothing made sense, I tried all the suggestions including turning off Windows features like Hyper-V and containers.
https://stackoverflow.com/questions/43379459/vagrant-up-it-stops-at-ssh-auth-method-private-key

# Solution task 1:

Following commands:
```bash
vagrant up
vagrant ssh saltmaster
sudo salt "docker*" state.apply
```

I think the more interesting part was, that as part as trying to solve the initial hurdle of setting up master/minion salt env, I looked more into the features of Vagrant (never have I used Ruby before).
And figured out a cool way to make VMs on a loop using:
```
[
    # ["minion",  "1024",    os_cent ],
    # ["minion",  "1024",    os_cent ],
    ["docker",   "1024",    os_cent],
  ].each_with_index do |element, index|

    (vmtype,mem,os) = element

```
The original idea was to have an array with web and db servers (for task 2), but I never went to implement that.
Still a cool concept I was not familiar.

Another thing I tried to do, but failed was Salt formulas. Maybe a good idea to showcase for the next courses.