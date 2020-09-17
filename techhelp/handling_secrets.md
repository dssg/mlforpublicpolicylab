# Some Tips for Handling Secrets
Keeping secrets (such as database passwords, API credentials, etc) out of your code is important to ensure the security your systems and data. While there are many approaches to doing so, two simple options are making use of environment variables and using secret config files.

## Option 1: Environment Variables
Environment variables you set at the bash command line are available to your code running in that environment and a good option for keeping secrets out of your code itself. You can set environment variables at the command line by assigning them with an `=` sign (avoid any spaces around the `=`) and check their value using `echo` and placing a `$` before the variable name:

```bash
you@server:~$ FOO="HELLO WORLD"
you@server:~$ echo $FOO
HELLO WORLD
```

In python, you can access these using the built-in `os` module, for instance if you had your database password stored in the `PGPASSWORD` environment variable:

```python
import os

db_pass = os.getenv('PGPASSWORD')
```

If you don't want to set the environment variables by time every time you start a new terminal session, you could also store them in a shell script that would load them up when run, for instance, you might have a file called `environment.sh` with contents:

```bash
export FOO="HELLO WORLD"
export BAR="BAZ"
```

Importantly, you'll need to **restrict the access to this file**: store it somewhere only you can access (e.g., your home directory), avoid committing it to a git repository, and change the permissions so only you can view it using `chmod 600 {filename}`.

Once you've created that file, any time you want to load the environment variables, you can simply run its contents as a shell script using `source`. For instance, if the file was named `environment.sh`:

```bash
you@server:~$ source environment.sh
```

## Option 2: Secrets Config File

A second option involves storing your secrets in a config file that can be read by your programs (any number of formats is reasonable: yaml, json, even plain text). For instance, you might create a file called `secrets.yaml` with contents such as:

```yaml
db:
  host: mlpolicylab.db.dssg.io
  port: 5432
  dbname: group_students_database
  user: andrewid
  password: 12345
web_resource:
  api_key: 23b53ca9845f70424ad08f958c94b275
```

Then, you can access your secrets within your code with the appropriate loading utility, such as (here, the `yaml` module is not built-in, but comes from the package `PyYAML`):

```python
import yaml

with open('path/to/secrets.yaml', 'r') as f:
  # loads contents of secrets.yaml into a python dictionary
  secret_config = yaml.safe_load(f.read())
```

This can be an easy way to feed secrets into your programs, but you'll need to **ensure these secrets don't accidentally get committed to github**. You could either provide the path to config file as an input parameter to your program (in which case, you could keep the secrets file somewhere entirely outside of the git repo, such as your home directory) or have it live in some expected location within the structure of the github repo, but use a `.gitignore` file to avoid committing the secrets file itself.

To do so, edit (or create) your `.gitignore` file at the top level of your repo to add (in the example where the secrets are contained in `secrets.yaml`):

```
# ignore secrets config
secrets.yaml
```

Make sure you've added and committed the `.gitignore` file to your repo, and then you should be able to confirm that your secrets file isn't being tracked with `git status`.
