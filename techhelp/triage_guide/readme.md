# Quick guide to Triage

## Tutorial
The best tutorial to use, with updated documentation and code, is a [colab notebook](https://colab.research.google.com/github/dssg/triage/blob/master/example/colab/colab_triage.ipynb) that comes with sample data and step-by-step instructions on using triage.

## Steps
1. Get your data set up
2. Determine design choices you need to make for your project
3. Code those choices in triage (mostly through the config file)
4. Run Triage
5. Look at the results in the database schema
6. Go back to 2, update, and iterate steps 3-6

## Design choices in the config file
1. Temporal Validation configuration
2. [Cohort and Labels](cohort_and_labels.md)
3. Features
4. Models and hyperparameters
5. Model Selection / Evaluation metrics

## What does Triage output and how to find it
1. [On disk - matrices and models](triage_outputs.md)
2. [In the database](triage_outputs.md)

[colab notebook](https://colab.research.google.com/github/dssg/triage/blob/master/example/colab/colab_triage.ipynb)
1. timechop (colab)
2. cohort and labels (colab)
3. features (colab plus new repo https://github.com/dssg/triage_cookbook/blob/main/cookbook/features.md)
4. models - baseline models, sklearn models from colab
5. metrics (lower priority) from colab
6. triage output (on disk, database, log) from colab
