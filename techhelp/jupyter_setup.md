# Using Jupyter Notebooks

## tl;dr
1. start jupyter server on the server from your project directory and select a port number **between 1024 and 65535** (more details below if you get an error) 
```bash
cd /data/groups/{group-name}/
jupyter notebook --no-browser --port {YOUR_PORT}
```

Take note of token once the command finishes running. it will be in a string similar to ``[I 04:14:21.181 NotebookApp] http://localhost8:888/?token=65d0e5010af61874004ddeea962cd727992a593b82bc4e1b``

2. Set up an SSH tunnel to connect to the server from your laptop:

```bash
ssh -N -L localhost:8888:localhost:{YOUR_PORT} {YOUR_ANDREW_ID}@mlpolicylab.dssg.io
```

3. Open browser on laptop and type in http://localhost:8888/ and enter token from step 1. Make sure to select the kernel with your group name when creating a notebook

## Before you get started

Although not a good environment for running your ML pipeline and models, jupyter notebooks can be useful for exploratory data analysis as well as visualizing modeling results. Since the data needs to stay in the AWS environment, you'll need to do so by running a notebook server on the remote machine and creating an SSH tunnel (because the course server can only be accessed via the SSH protocol) so you can access it via your local browser.

One important note: **be sure to explicitly shut down the kernels when you're done working with a notebook** (you can do this from the notebook directory listing: see the figure below) as "zombie" notebook sessions can end up using up a lot of processed!

![notebook shutdown](/techhelp/img/jupyter-shutdown.png)

## Starting up the server
On the course server, you'll want to choose an open port for your notebook server (so you can consistently access it in the same place). You can see the ports currently in use with:
```bash
ss -lntu
```
Choose a port number **between 1024 and 65535** that is **NOT** on that list.

Next, you'll actually start the notebook server -- you may want to consider doing this in a `screen` session to ensure the keep ther server persistent (see the [linux command line section of the tech setup readme](https://github.com/dssg/mlforpublicpolicylab/tree/master/techhelp#linux-command-line-bash) for details). Make sure you're in your group's python virtualenv and start your notebook server, for instance using:
```bash
cd /data/groups/{group-name}/
jupyter notebook --no-browser --port {YOUR_PORT}
```
or
```bash
source /data/groups/{group-name}/dssg_env/bin/activate
jupyter notebook --no-browser --port {YOUR_PORT}
```
Your group name is bills1, schools1, etc.

Note that whatever directory you're in when you start the server is where your notebooks will be stored. Starting the server will print out a message indicating that the server is starting and giving you a token you can use to access it, which looks something like this:

![notebook server startup](/techhelp/img/jupyter-terminal.png)

Take note of the token (outlined with the red box in the image), as you'll need this to log in.

## Accessing the server from your browser
Now, on your local machine, you'll need to set up an SSH tunnel to connect to the server:

```bash
ssh -N -L localhost:8888:localhost:{YOUR_PORT} {YOUR_ANDREW_ID}@mlpolicylab.dssg.io
```

Note that if you already have a local notebook server running, you may need to choose a different port than 8888 to map to, but we'll assume this is open here. Also, you may need to specify the "-i" parameter to provide the path to your private key file. If you're on windows, you may need to do this using PuTTY -- [see the instructions here](https://docs.bitnami.com/bch/faq/get-started/access-ssh-tunnel/)

Running this command won't look like it did anything because it's just opening a connection between your machine and the course server to route traffic to the local port (here, 8888) to the port you choose for your notebook server on the class server. **You'll need to keep this terminal/putty session open to maintain the tunnel**

Finally, open a browser of your choice on your local machine and navigate to http://localhost:8888/ and you should get a jupyter notebook login page asking for the token that was generated when you started the server (if this doesn't work, you might also try http://0.0.0.0:8888/ or http://127.0.0.1:8888/ ):

![notebook browser login](/techhelp/img/jupyter-login.png)

If you successfully log in, you should see a directory listing where you started the notebook server on the remote server allowing you to create new python files.

To make sure packages you install in your group's python virtualenv are available, we have created a kernel with each group's name that uses this virtualenv. **Be sure you're selecting the kernel with your group name when creating a notebook** (we'll eventually be deleting the "Python 3" kernel to avoid confusion as well):

![creating a new notebook](/techhelp/img/jupyter-new-nb.png)

## Shutting down
You'll need to do two things to shut down your notebook server:
1. Kill the notebook server on the remote machine (return to the terminal/screen window where the server is running and type control-C then `y` when prompted if you reall want to shut down)
1. Close the SSH tunnel on your local machine: on linux/macos, you can do so by running `ps aux | grep {YOUR_PORT}` to find the process id (PID) then using `kill {PID}`, or alternatively closing the terminal session you used to start it. With putty on windows, you should simply be able to close the putty session.
