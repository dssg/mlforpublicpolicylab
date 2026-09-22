## Reaching the Course Server
We have created an ubuntu linux server that you'll be able to use for your project work at `server.mlpolicylab.dssg.io` –– you should be able to reach it via SSH with the private key corresponding to the public key you provided us and using your Andrew ID as your username.

NOTE: The course infrastructure is **only accessible from the CMU VPN (or on campus)**. When logging onto the VPN, be sure to use the **Full VPN** option in order to be able to reach the class server.

Once connected, here are a couple of commands you could run and expected output to verify that you're on the server (only type the commands after the "$" prompt and the output is shown on the next line):
```
andrewid@mlpolicylab-94889:~$ hostname
mlpolicylab-94889

andrewid@mlpolicylab-94889:~$ pwd
/class/{andrew_id}
```

## Reaching the Course Database
Most of the data for the course projects will be provided in a postgres database. Once you're connected to the server, you can reach the database using the psql command line utility. The database server is at `database.mlpolicylab.dssg.io` and your username is again your Andrew ID. Here's an example of connecting to the database:
```
andrewid@mlpolicylab-94889:~$ PAGER='less -S' psql -h database.mlpolicylab.dssg.io -U {YOUR_ANDREW_ID} group_students_database 
psql (11.6 (Ubuntu 11.6-1.pgdg18.04+1), server 11.5)
SSL connection (protocol: TLSv1.2, cipher: ECDHE-RSA-AES256-GCM-SHA384, bits: 256, compression: off)
Type "help" for help.

group_students_database=> SELECT 1+1 AS foo;
 foo
-----
   2
(1 row)

group_students_database=> SELECT CURRENT_USER;
 current_user
--------------
 {your_andrew_id}
(1 row)

group_students_database=> \q
```
Here, we're connecting to an empty `group_students_database` for the time being, but once the teams are formed, we'll follow up with instructions on connecting to a team database populated with some data.

Your password for the database can be found in the `.pgpass` file in your home directory (it's everything after the last colon). While you can only reach the database from the course server, you can use a local SQL client like [dbeaver](https://dbeaver.io/) or [datagrip](https://www.jetbrains.com/datagrip/) by establishing an SSH tunnel through the server (see details below).

## Using dbeaver
One option for connecting to the database from your local machine is to use [dbeaver](https://dbeaver.io/) (other SQL interpreters are fine as well, but this one has a free community edition that is relatively easy to get up and running with).

A couple of pointers on getting set up:

- To get started, you may need to install a different SSH package called "SSHJ" -- under the Help menu, choose "Install new Software" then search for SSHJ and install the package (you'll need to restart dbeaver) Note that sometimes the setup works out of the box without this.
- You'll need to connect via an SSH tunnel, so when you set up your database connection, look for the SSH tab and set up the tunnel to `server.mlpolicylab.dssg.io` with your Andrew ID and private key file (choosing "public key" as the authentication method)
- If you installed it, be sure to choose SSHJ as the method under advanced
- Then you can test your SSH tunnel by clicking the button below (you might need to make your window larger to see it)
- Once your tunnel is working, under the general tab you can set up your database connection using `database.mlpolicylab.dssg.io` for the server, your Andrew ID, and the password from your `.pgpass` file on the server (everything after the last colon). The database name should be your group database (for now, `group_students_database` but you'll need to change to your group database once that's assigned)
- Click the button to test the full connection and if that works finish setting up the database
- Once done, in the left pane you'll be able to browse the database structure and in the right pane run SQL queries (you may need to create a new SQL editor)

## Github
You should have received an invite to the "Machine Learning Public Policy Class" github team in the DSSG organization based on the github user id you created. Currently, this team has access to [one repository](https://github.com/dssg/test-mlpolicylab-private) that you can use to test your configuration, but we'll be creating separate repositories for each project team to work on once those are set up. Here's what you'll need to do:

- Add your **public ssh** key to your github account following the [instructions here](https://help.github.com/en/enterprise/2.17/user/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account) (this can be the same one you use to connect to the server or a new one)

- Copy the corresponding **private key** to the server -- it needs to live in `~/.ssh/` with "600" permissions. Here's how you might do that:
  - on your local machine: `scp {/path/to/your/key_file} your_andrew_id@server.mlpolicylab.dssg.io:~/.ssh/`
  - then, on the course server: `chmod 600 ~/.ssh/{key_file}`

- Make sure you key is registered with the SSH agent:
  - on the course server: `eval "$(ssh-agent -s)"`
  - then: `ssh-add ~/.ssh/{key_file}`

- Check that everything is correct so far by connecting to github:
  - on the course server: `ssh git@github.com`

- (if all is well, you should get a message recognizing your git username saying you have successfully authenticated)

- Configure the github CLI. On the course server:
  - `git config --global user.name "Your name here"`
  - `git config --global user.email "your_email@example.com"`
  - `git config --global color.ui true`
  - `git config --global push.default current`

- Clone the private test repo. On the course server: 
   - `git clone git@github.com:dssg/test-mlpolicylab-private.git`

- Finally, confirm that you've cloned the repo by printing out the README file:
  - on the course server: `cat test-mlpolicylab-private/README.md`

Once you have that working, your github access should be all set for the course.

Anyway, once you can do all that, you should be in good shape for most of the technical resources you'll need for class! Please feel free to ping us on slack in the **#help** channel if you run into trouble with any of the steps here, and we'll be cover all of these details in the Wednesday tech session as well.

