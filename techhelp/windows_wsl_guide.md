# Setting up WSL on your Windows Machine

Newer versions of windows (10, 11) have the option of running a linux environment directly on windows, and we recommend using that as your development environment. You can [learn more about WSL here](https://docs.microsoft.com/en-us/windows/wsl/about).

First we have to install WSL on Windows. We'll give you the quick installation guide, if you want to customize things, please refer the [detailed installation guide](https://docs.microsoft.com/en-us/windows/wsl/install).

First, open a PowerShell or a Command Prompt Window as an Administrator. Next, we can see the available Linux distributions for install by using:

```
$ wsl --list --online
```

Then, you can install the version of Linux you would like to install. We recommend picking one of the Ubuntu distributions and this guide assumes an Ubuntu installation for WSL. 

We can install Ubuntu 20.04 by:

```
$ wsl --install -d Ubuntu-20.04
```

This will take a few minutes, and will prompt you to provide a UNIX username and a password. Please note that you might have to restart your computer at some point during the installation for things to take full effect. 

Now, you can use Linux from within your Windows machine. You should have a shortcut in your start menu to launch WSL, and when you launch it should open up a CLI. 

 Note that this will have no GUI and you'll have to rely on the CLI. If you need to access the file system of WSL through the Windows File Explorer, you can type the following in the address bar of the File Explorer. 

```
\\wsl.localhost\Ubuntu-20.04
```

This will take you to the root folder of the linux file system. 

_Note - Appending `\home\<username>` to the above address will take you to your home directory._

## SSH Keys

To generate SSH keys, we can use the same process as a UNIX system. 

```
$ ssh-keygen
```

This will prompt you to select a location for storing the key, and give you the option to add a passphrase to the key. If you want to use the default locaion (Recommended!) and not use a passphrase, you just have to hit return. 

Then, your keys will be stored in the place your specified. By default, 
- there'll be a `.ssh` folder in your home directory
` ~/.ssh/`
- private key would be named `id_rsa`
- public key would be named `id_rsa.pub`

You've successfully generated the Keys!

After having generated the key pair, you should set the correct file permissions for your private key SSH requires that only you, the owner, are able to read/write it, and will give you an error otherwise. You can set the right permissions with this command:
```
$ chmod 600 path_to_your_private_key
```
(you'll have to substitute in
the path and name of your private key that you chose during key generation).


Note: You will share the public key with us to setup ssh access for the class server. 

### Making your ssh keys available to local clients installed on Windows

The keys we just generated are on the "linux machine" on your computer. However, local software such as VSCode and DBeaver are insalled on Windows and they would need access to the ssh keys to connect to the compute server and database. We can do this in two ways:

**Option A: Find WSL .ssh folder on the Windows filesystem**

One way to do this is to find the windows file system path for the ssh keys and pointing VSCode and DBeaver there.

If you used the default path to save the ssh keys, the private key should be located at the following path: 

```
\\wsl.localhost\Ubuntu-20.04\home\<linux username>\.ssh\id_rsa
```

**Option B: Copy over the keys to Windows**

The second way to do this is to simply copy the two files over to the default location Windows would store any ssh keys. If you don't have any other ssh keys on your Windows machine already, you can use the following commands:

```
# create the default windows folder
$ mkdir /mnt/c/<windows username>/.ssh

# copy both private and public keys over
$ cp -r ~/.ssh/ /mnt/c/<windows username>/.ssh/
```

Then, you can simply point VSCode and Dbeaver to the private key in the Windows file system. 



