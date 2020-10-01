# Tech Setup

1. Make sure you are on cmu vpn (Full VPN group)
2. Connect to class server: mlpolicylab.dssg.io (command line/terminal/putty) : type `ssh your_andrew_id@mlpolicylab.dssg.io`
3. Connect to database server: mlpolicylab.db.dssg.io If you're on the server, type `psql -h mlpolicylab.db.dssg.io -U YOUR_ANDREW_ID group_students_database`
4. setting up dbeaver (a visual ide to the database) [instructions are here](https://github.com/dssg/mlforpublicpolicylab/raw/master/techhelp/dbeaver_instructions.pdf)

**Detailed instructions** are in [slack post](https://mlppfall2020.slack.com/files/T01A8J5N01E/F01A4RF49U4?origin_team=T01A8J5N01E&origin_channel=C019AFXU9NK)

**[Slides from week 1 tech session](https://docs.google.com/presentation/d/1MEP-UF9dHuEfoIWWKIphFAYI23miVHCovLJgndPLgvE/edit#slide=id)**

## ssh
`ssh your_andrew_id@mlpolicylab.dssg.io`

ssh is what you'll use to connect to the class server, which is where you will do all the work. You will need to give us your ssh key, using the instructions we sent, and then you'll be good to go. Based on which operating system you're using, you can google for which tool is the best (command line, terminal, putty, etc.)

## Linux Command Line (Bash)
If you're not too familiar with working at the command line, we have a quick overview and intro [here](https://dssg.github.io/hitchhikers-guide/curriculum/setup/command-line-tools/)

A couple of quick pointers that might be helpful:
- One of the most useful linux utilities is `screen`, which allows you to create sessions that persist even when disconnect from ssh. This can be handy for things like long-running jobs, notebook servers, or even just to guard against your internet connection dropping and losing your work. Here's a quick [video intro](https://www.youtube.com/watch?v=3txYaF_IVZQ) with the basics and a more [in-depth tutorial](https://linuxize.com/post/how-to-use-linux-screen/) (note that screen is already installed, so you can ignore those details).
- Everyone is sharing the resources of the course server and it can be a good idea to keep an eye on memory and processor usage (both to know if you're hogging resources with your processes and understand how the load looks before starting a job). A good way to do so is with the utility [htop](https://www.deonsworld.co.za/2012/12/20/understanding-and-using-htop-monitor-system-resources/), which provides a visual representation of this information (to open htop just type `htop` at the command prompt and to exit, you can simply hit the `q` key)
- Each group should have their own folder on the server, in `/data/groups/{group name}`. For example, `/data/groups/bills1`
- We've set up a shared python virtual environment for each group. This will automatically activate when you navigate to `/data/groups/{group_name}`. Or, manually activate it with `source /data/groups/{group_name}/dssg_env/bin/activate`.
- When you first navigate to `/data/groups/{group_name}` you'll get a message prompting you to run `direnv allow`. Run this command to allow the automatic virtual environment switching.

## github
We'll use github to collaborate on the code all semester. You will have a project repository based on your projhect assignment.

#### common (extremely simple) workflow

- When you start working:
  - The first time, clone an existing repo: `git clone`
  - Every time, get changes since last time: `git pull`
- Add new files: `git add` or make changes to existing files
- Make a local checkpoint: `git commit`
- Push to the remote repository: `git push`

A [more advanced cheatsheet](https://gist.github.com/jedmao/5053440). Other useful tutorials are [here](https://dssg.github.io/hitchhikers-guide/curriculum/setup/git-and-github/basic_git_tutorial/)

## PostgreSQL
If you're not too familiar with SQL or would like a quick review, we have an overview and intro [here](https://dssg.github.io/hitchhikers-guide/curriculum/software/basic_sql/).

Additionally, check out these [notes and tips about using the course database](class_db_pointers.md).

## psql
PSQL is a command line tool to connect to the postgresql databvase server we're using for class. You will bneed to be on the server through assh first and then type `psql -h mlpolicylab.db.dssg.io -U YOUR_ANDREW_ID databasename` where `databasename` is the database for your project that you will receive after your project assignment. To test it you can use `psql -h mlpolicylab.db.dssg.io -U YOUR_ANDREW_ID group_students_database` - make sure to change `YOUR_ANDREW_ID`

A couple quick usage pointers:
- `\dn` will list the schemas in the database you're connected to
- `\dt {schema_name}.*` will list the tables in schema `{schema_name}`
- `\d {schema_name}.{table_name}` will list the columns of table `{schema_name}.{table_name}`
- `\x` can be used to enter "extended display mode" to view results in a tall, key-value format
- For cleaner display of wide tables, you can launch `psql` using: `PAGER='less -S' psql -h mlpolicylab.db.dssg.io -U YOUR_ANDREW_ID databasename` (then use the left and right arrows to navigate columns of wide results)
- `\?` will show help about psql meta-commands
- `\q` will exit

## dbeaver
dbeaver is a free tool that gives you a slightly nicer and visual interface to the database. [Instructions for installinfg and set up are here]
(https://github.com/dssg/mlforpublicpolicylab/raw/master/techhelp/dbeaver_instructions.pdf)

## Connecting to the database from python
The `sqlalchemy` module provides an interface to connect to a postgres database from python (you'll also need to install `psycopg2` in order to talk to postgres specifically). You'll can install it in your virtualenv with:
```
pip install psycopg2-binary sqlalchemy
```
(Note that `psycopg2-binary` comes packaged with its dependencies, so you should install it rather than the base `psycopg2` module)

A simple usage pattern might look like:
```python
from sqlalchemy import create_engine

# read parameters from a secrets file, don't hard-code them!
db_params = get_secrets('db')
engine = create_engine('postgres://{user}:{password}@{host}:{port}/{dbname}'.format(
  host=db_params['host'],
  port=db_params['port'],
  dbname=db_params['dbname'],
  user=db_params['user'],
  password=db_params['password']    
))
result_set = engine.execute("SELECT * FROM your_table LIMIT 100;")
for record in result_set:
  process_record(record)

# Close communication with the database
engine.dispose()
```

If you're changing data in the database, note that you may need to use `engine.execute("COMMIT")` to ensure that changes persist.

Note that the engine object can also be used with other utilities that interact with the database, such as ohio or pandas (though the latter can be very inefficient/slow)

**For a more detailed walk-through of using python and postgresql together, check out the [Python+SQL tech session notebook](python_sql_tech_session.ipynb)**

## Jupyter Notebooks
Although not a good environment for running your ML pipeline and models, jupyter notebooks can be useful for exploratory data analysis as well as visualizing modeling results. Since the data needs to stay in the AWS environment, you'll need to do so by running a notebook server on the remote machine and creating an SSH tunnel (because the course server can only be accessed via the SSH protocol) so you can access it via your local browser.

One important note: **be sure to explicitly shut down the kernels when you're done working with a notebook** as "zombie" notebook sessions can end up using up a lot of processed!

You can find some details about using jupyter with the class server [here](jupyter_setup.md)

## Handling Secrets
You'll need access to various secrets (such as database credentials) in your code, but keeping these secrets out of the code itself is an important part of keeping your infrastructure and data secure. You can find a few tips about different ways to do so [here](handling_secrets.md)



