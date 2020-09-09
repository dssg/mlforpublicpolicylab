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

## psql
PSQL is a command line tool to connect to the postgresql databvase server we're using for class. You will bneed to be on the server through assh first and then type `psql -h mlpolicylab.db.dssg.io -U YOUR_ANDREW_ID databasename` where `databasename` is the database for your project that you will receive after your project assignment. To test it you can use `psql -h mlpolicylab.db.dssg.io -U YOUR_ANDREW_ID group_students_database` - make sure to change `YOUR_ANDREW_ID`

## dbeaver
dbeaver is a free tool that gives you a slightly nicer and visual interface to the database. [Instructions for installinfg and set up are here]
(https://github.com/dssg/mlforpublicpolicylab/raw/master/techhelp/dbeaver_instructions.pdf)

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







