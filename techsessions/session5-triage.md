# Tech Session 5: Triage Intro and Setup

By the end of the session you'll have seen a complete triage run on sample data, understood what each part of the config controls, and started a run
on your own project.

## Goals for today
1. Get familiar with [Triage](http://github.com/dssg/triage) in a controlled environment (colab notebook)
2. Make sure everyone has triage package installed in their virtual environment
3. Get everyone familiar with running triage
4. Do a first pass at setting up and running triage for your projects
   
---

## 1. Before anything else

Open the [Colab tutorial](https://colab.research.google.com/github/dssg/triage/blob/master/example/colab/colab_triage.ipynb), change the runtime (follow the instructions), run the first four cells now, before we start talking. They install Python
3.11, start a Postgres server, load the sample data, and install triage, and they
take several minutes. Then come back.

The tutorial uses DonorsChoose data: classroom projects posted by teachers, and
the question of whether a project gets fully funded within four months. It's a
different domain from either class project, which is the point — the structure is
the same.

## 2. Get familiar with triage in a controlled environment:  The Colab tutorial

Don't run all 115 cells. Work through these, and read rather than skim the markdown between them:

**Look at the data** (cells 9–17). Two tables: projects and donations. Notice
that every row has a date, and that these dates tell us when events happen - Triage uses these dates to make various design decisions.

**The formulation section** (cells 18–26). This is the part to read carefully. It
walks through the cohort, the label, the handling of time, the metric, the
features, and the model grid — the same decisions you'll make (and in some cases, have already made) in your prokect,
written out in the order triage needs them.

**The config** (cell 29). This is the whole *run* in one file. Read it
before running anything. Every section maps to a component of the
pipeline we covered on Thursday.

**Let's run it** (cells 33–35). This takes a few minutes.

**Look at what came out** (cells 37–68). The reporting object is the fastest way
to understand what triage actually did:

- `rep.timesplits()` — the train/test splits it built from your temporal config
- `rep.cohorts()` — how many entities per as-of date, and the base rate
- `rep.features()` — every feature it generated, from a short config block
- `rep.model_performance()` — results for every model in the grid

Let's stop here for now. We'll cover additional components (Audition and the bias audit for example) later.

---

## 3. What triage is and isn't

[Slides](https://github.com/dssg/mlforpublicpolicylab/blob/master/techsessions/triage_tech_session.pptx) for this discussion. We're not going through all the slides, but keep this as a reference for the semester.

**It is** an end-to-end pipeline for the type of problems we work on in societal and policy problems: you have
entities (people, bills, facilities, homes, etc.) that exist over time, you need to predict various outcomes (at different time horizons) at repeated decision points, and you'll act on a ranked list of them.

**It isn't** a modeling library. It doesn't invent new algorithms — it calls scikit-learn and other ML packages. What it does is everything around the model: building cohorts and
labels as of each date, generating time-aware features without leaking, splitting
time correctly, running a grid, storing every artifact - matrices, models, predictions, and evaluations, and
auditing for bias.

**Why we use it here.** Almost all of that work surrounding the model is where projects go
wrong, and a lot of it is similar across projects. Writing it from scratch every time means you risk introducing bugs, leakage, and other issues.

**What the config file really is.** It's your formulation, written in code. Almost every
decision you make in the larger ML system appears as a line of YAML

| Config section | What it decides |
| --- | --- |
| `temporal_config` | When decisions get made, how far back training looks, how long you wait to observe an outcome, how often the model is retrained |
| `cohort_config` | Who is eligible for the intervention on a given date |
| `label_config` | What counts as the outcome, and over what time horizon |
| `feature_aggregations` | What the model will know about each entity as of the prediction/decision date |
| `grid_config` / `model_grid_preset` | Which models and hyperparameters to try |
| `scoring` | How you'll evaluate candidate models and select the high-performing ones — and at what threshold, which should come from how many entities you can actually act on |
| `bias_audit_config` | Which groups to check for disparities |
---

## 3. Installing Triage on the server (in your virtual environment)

   - You should already have it installed from last time. If not, do `pip install triage`
   - You should also have (or can create) the database.yaml for your project that has your project database credentials
   - Create a run.py to run triage (you can use the code [here](triage_session/sample_run.py) as a starting point and modify it with the right filepaths.)


---
## 4. Running Triage on your project

Skeleton configs are in your project repository We've put in placeholder values for many of the parameters but have left a few things blank:

Fill in, in this order:

1. **`cohort and label_config`** — the query, using the `{as_of_date}` and
   `{label_timespan}` placeholders. If you have a cohort and label query from your
   formulation work, start from that. 
2. **`scoring`** — precision and recall at a handful of thresholds. You'll eventually pick
   thresholds that correspond to how many entities your partner could actually act
   on, but it's fine to have a large number of them for triage to compute and store (for later analysis).

Then run triage inside a `screen` session using the run.py file you created and the config file you've just updated.

### Things that may go wrong

- **YAML indentation**, especially inside the multi-line label query. It is the
  single most common failure. You can use yaml checkers on the web to test and fix the yaml.
- **Your label query returns the wrong columns.** It must return exactly
  `entity_id` and `outcome`.
- **Empty cohorts.** If `rep.cohorts()` shows zero entities on some dates, your
  temporal config and your data don't overlap the way you think they do.


## Useful Triage Resources
- [github repo](http:github.com/dssg/triage) - has code and links to documentation
- [colab demo notebook](https://colab.research.google.com/github/dssg/triage/blob/master/example/colab/colab_triage.ipynb) has a lot of inline documentation that will be useful
- [Triage quickstart guide](https://dssg.github.io/triage/quickstart/)
- [Typical project workflow](https://dssg.github.io/triage/triage_project_workflow/)
- [Common configuration recipes](https://github.com/dssg/triage_cookbook)
