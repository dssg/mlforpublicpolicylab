# Tech Session 5
## Intro to [Triage](http://github.com/dssg/triage)

The purpose of this session is to introduce everyone to [Triage](http://github.com/dssg/triage), give some hands-on experience, and provide access to documentation that can be used throughout the semester (and later)

### What to do
1. Start the [colab demo notebook](https://colab.research.google.com/github/dssg/triage/blob/master/example/colab/colab_triage.ipynb) and install things. This will take 20 minutes, so we'll do that right away and then proceed to triage architecture and components while we wait for the installation to finish.
2. Talk about Triage - what it is, what it does, and how to use it
3. Run the colab notebook, starting from the section "Running Triage". The notebook will allow you to quickly make changes to the configuration, rerun triage, and become familiar with how it works.
4. Get triage set up on the server for the donorschoose problem
   - create a directory for the session today
   - [a sample config file for donorschoose is available to start with](triage_session/donors_small_config.yaml) - copy the sample config file there (you can use VSCode to create a file and copy and paste for example)
   - create a database.yaml for your individual donorschoose database in that directory (the credentials are the same as earlier except for the database name - it is donorschoose_yourandrewid (donorschoose_ghani for example)
   - create a run.py to run triage (you can use the code in the colab notebook for inspiration and create a run.py that you can call from the command line - hint: search for run.py in the notebook)
6. Run triage through your run.py file (python run.py)
7. Look at the results using SQL (and later using this notebook)

## Useful Triage Resources
- [github repo](http:github.com/dssg/triage) - has code and links to documentation
- [colab demo notebook](https://colab.research.google.com/github/dssg/triage/blob/master/example/colab/colab_triage.ipynb) has a lot of inline documentation that will be useful
- [Triage quickstart guide](https://dssg.github.io/triage/quickstart/)
- [Typical project workflow](https://dssg.github.io/triage/triage_project_workflow/)
- [Common configuration recipes](https://github.com/dssg/triage_cookbook)
