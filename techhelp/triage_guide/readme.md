# Quick guide to Triage

## Tutorial
The best tutorial to use, with updated documentation and code, is a [colab notebook](https://colab.research.google.com/github/dssg/triage/blob/master/example/colab/colab_triage.ipynb) that comes with sample data and step-by-step instructions on using triage.

## Sample Projects to look at for features and modeling tips
1. [Early Warning Tool for prioritizing individuals for screenings based on risk of MASLD related liver complications)](https://github.com/dssg/masld_prediction).  The [Triage config file directory](https://github.com/dssg/masld_prediction/tree/main/triage_config_files) has example config files and feature config files that may be helpful.
2. [Preventing Homelessness by Prioritizing Outreach for Rental Assistance](https://github.com/dssg/acdhs_housing_public). The [Triage config file directory](https://github.com/dssg/acdhs_housing_public/tree/main/pipeline/configs) has example config files and feature config files that may be helpful.
   
## Workflow Steps
1. Get your data set up
2. Determine design choices you need to make for your project
3. Code those choices in triage (mostly through the config file)
4. Run Triage
5. Look at the results in the database schema
6. Go back to 2, update, and iterate steps 3-6

## Design choices in the config file
1. [Temporal Validation configuration](temporal_configuration.md)
2. [Cohort and Labels](cohort_and_labels.md)
3. [Features](features.md)
4. [Models and hyperparameters](models.md) 
5. [Model Selection / Evaluation metrics](metrics.md)

## What does Triage output, and how to find it
1. [On disk - matrices and models](triage_outputs.md)
2. [In the database](triage_outputs.md)

## Built-in Triage utilities to use once models are built
1. Triage Experiment Summary
2. SQL (look at the database)
3. Audition
4. Post-Modeling
5. Aequitas
