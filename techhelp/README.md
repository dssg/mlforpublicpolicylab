# Tech Setup

1. Make sure you are on cmu vpn (Full VPN group)
2. Connect to class server: mlpolicylab.dssg.io (command line/terminal/putty) : type `ssh your_andrew_id@server.mlpolicylab.dssg.io`
3. Connect to database server: mlpolicylab.db.dssg.io If you're on the server, type `psql -h database.mlpolicylab.dssg.io -U YOUR_ANDREW_ID group_students_database`
4. Setting up dbeaver or dbvisualizer (a visual ide to the database) [instructions are here](https://github.com/dssg/mlforpublicpolicylab/raw/master/techhelp/dbeaver_instructions.pdf)

**Detailed instructions** are [available here](infrastructure_quickstart.md) and will be covered at the first Wednesday tech 

**Tech Session Materials:**
- **[Slides from week 1 tech session - getting set up](https://docs.google.com/presentation/d/1000fsCMmJ6duWJDdGrOwQpuoR1DQnfIfg3aodAzbVtE/edit#slide=id.g27781b3f361_0_13)**
- **[Materials from week 2 tech session - remote workflows](https://github.com/dssg/mlforpublicpolicylab/blob/master/techhelp/remote-workflow/remote-workflow.md)**
- **[Slides from week 3 tech session - git](https://docs.google.com/presentation/d/1tdBxFn1ZSkZLRk8J2pN9O2zt2f9_1kAbhQGiin1908I/edit#slide=id.p)**

## ssh
`ssh your_andrew_id@server.mlpolicylab.dssg.io`

ssh is what you'll use to connect to the class server, which is where you will do all the work. You will need to give us your **public** ssh key, using the instructions we sent, and then you'll be good to go. Based on which operating system you're using, you can google for which tool is the best (command line, terminal, putty, etc.)

## Linux Command Line (Bash)
If you're not too familiar with working at the command line, we have a quick overview and intro [here](https://dssg.github.io/hitchhikers-guide/curriculum/setup/command-line-tools/)

A couple of quick pointers that might be helpful:
- One of the most useful linux utilities is `screen` (or tmux), which allows you to create sessions that persist even when disconnect from ssh. This can be handy for things like long-running jobs, notebook servers, or even just to guard against your internet connection dropping and losing your work. Here's a quick [video intro](https://www.youtube.com/watch?v=3txYaF_IVZQ) with the basics and a more [in-depth tutorial](https://linuxize.com/post/how-to-use-linux-screen/) (note that screen is already installed, so you can ignore those details).
- Everyone is sharing the resources of the course server and it can be a good idea to keep an eye on memory and processor usage (both to know if you're hogging resources with your processes and understand how the load looks before starting a job). A good way to do so is with the utility [htop](https://www.deonsworld.co.za/2012/12/20/understanding-and-using-htop-monitor-system-resources/), which provides a visual representation of this information (to open htop just type `htop` at the command prompt and to exit, you can simply hit the `q` key)
- Each group should have their own folder on the server, in `/data/groups/{group name}`. For example, `/data/groups/bills1`
- We've set up a shared python virtual environment for each group. This will automatically activate when you navigate to `/data/groups/{group_name}`. Or, manually activate it with `source /data/groups/{group_name}/dssg_env/bin/activate`.
- When you first navigate to `/data/groups/{group_name}` you'll get a message prompting you to run `direnv allow`. Run this command to allow the automatic virtual environment switching.

## github
We'll use github to collaborate on the code all semester. You will have a project repository based on your projhect assignment.

### common (extremely simple) workflow

- When you start working:
  - The first time, clone an existing repo: `git clone`
  - Every time you want to start working, get changes since last time: `git pull`
- Add new files: `git add` or make changes to existing files
- Make a local checkpoint: `git commit`
- Pull any new remote updates from your teammates (`git pull`) then push to the remote repository: `git push`

A [more advanced cheatsheet](https://gist.github.com/jedmao/5053440). Another useful tutorial is [here](https://dssg.github.io/hitchhikers-guide/curriculum/setup/git-and-github/basic_git_tutorial/) and you might want to check out [this interactive walk-through](https://learngitbranching.js.org/) (however some of the concepts it focuses on go beyond what you'll need for class)

## PostgreSQL
If you're not too familiar with SQL or would like a quick review, we have an overview and intro [here](https://dssg.github.io/hitchhikers-guide/curriculum/software/basic_sql/).

Additionally, check out these [notes and tips about using the course database](class_db_pointers.md).

## psql
PSQL is a command line tool to connect to the postgresql databvase server we're using for class. You will bneed to be on the server through assh first and then type `psql -h database.mlpolicylab.dssg.io -U YOUR_ANDREW_ID databasename` where `databasename` is the database for your project that you will receive after your project assignment. To test it you can use `psql -h mlpolicylab.db.dssg.io -U YOUR_ANDREW_ID group_students_database` - make sure to change `YOUR_ANDREW_ID`

A couple quick usage pointers:
- `\dn` will list the schemas in the database you're connected to
- `\dt {schema_name}.*` will list the tables in schema `{schema_name}`
- `\d {schema_name}.{table_name}` will list the columns of table `{schema_name}.{table_name}`
- `\x` can be used to enter "extended display mode" to view results in a tall, key-value format
- For cleaner display of wide tables, you can launch `psql` using: `PAGER='less -S' psql -h mlpolicylab.db.dssg.io -U YOUR_ANDREW_ID databasename` (then use the left and right arrows to navigate columns of wide results)
- `\?` will show help about psql meta-commands
- `\q` will exit

## dbeaver
dbeaver is a free tool that gives you a slightly nicer and visual interface to the database. [Instructions for installing and set up are here](https://github.com/dssg/mlforpublicpolicylab/raw/master/techhelp/dbeaver_instructions.pdf)

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
engine = create_engine('postgresql://{user}:{password}@{host}:{port}/{dbname}'.format(
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

## Triage Pointers
We'll be using `triage` as a machine learning pipeline tool for this class. Below are a couple of links to resources that you might find helpful as you explore and use `triage` for your project:
- An [example experiment configuration](https://github.com/dssg/triage/blob/master/example/config/experiment.yaml), with lots of detailed comments about the various parameters and options available
- The [triage documentation site](https://dssg.github.io/triage/), in particular the [deeper look at triage](https://dssg.github.io/triage/dirtyduck/triage_intro/) and [experiment configuration](https://dssg.github.io/triage/experiments/experiment-config/) pages
- The [triage homepage](http://www.datasciencepublicpolicy.org/projects/triage/) has some high-level details about the project and links out to a few example previous projects we've done that might be helpful

Also, here are a few tips as you're working on your project:
- Start simple and build your configuration file up iteratively. For initial runs, focus on a smaller number of training/validation splits, features, model types, etc.
- If you want to perform some basic checks on your experiment configuration file without actually running the model grid, you can use `experiment.validate()` to do so. There are some details in the [documentation here](https://dssg.github.io/triage/experiments/running/#validating-an-experiment)
- Because storing entity-level predictions for every model configuration you run can be costly, you might want to consider running with `save_predictions=False` at first, then adding predictions later only for models of interest.
- Generally you can use any classification model offered by `sklearn` as well as anything with an `sklearn`-style API. Triage also provides a couple of useful built-in model types including some [baseline models](https://github.com/dssg/triage/tree/master/src/triage/component/catwalk/baselines) and [classifiers](https://github.com/dssg/triage/tree/master/src/triage/component/catwalk/estimators)
- [Example jupyter notebook](visualize_timechops_example.ipynb) to visualize the training and validation splits computed by triage's Timechop component.

