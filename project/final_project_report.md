# Final Project Report

**Due: December 17, 11:59pm EST**

The final project report should be approximately 10-15 pages in length (excluding appendix and references) and cover the following topics:

1. Executive Summary: Succinctly describe the project, results, and recommendations. The executive summary should not exceed 1 page in length.
1. Background and Introduction: This section motivates the problem, explains why it's important, why should we care, and the potential impact if it's solved.
1. Related work: What's been done before in this area (both using and ML and without) and why your work is different or better.
1. Problem formulation and Overview of your solution
1. Data Description, including briefly highlighting any data exploration that informed important formulation/modeling choices.
1. Details of your solution: methods, tools, analysis you did, model types and hyperparameters used, features. This section of the report should also include a link to well-documented code in your group’s course github repository.
1. Evaluation: results, plots (for example precision recall k curves, other types of results), important features, and bias audit of the models you built.
1. Discussion of the results: what did you learn from looking at the results about the data, problem, and solution.
1. Brief (1-2 paragraph) design of a field trial to evaluate the accuracy of the model you built and selected in practice, as well as its ability to help the organization achieve its goals. It's not enough to say we'll do an A/B test or a randomized trial.
1. Policy Recommendations based on your analysis/models
1. Limitations, caveats, future work to improve on what you've done.
1. Optionally, you may also wish to include a proposal for future avenues of research beyond the scope of this work, for instance on novel machine learning methods to improve on the current work, new policy interventions to evaluate or explore, or other related research opportunities.

## Appendix
Please include  the following details in an appendix so we can better evaluate the work you've done and not just evaluate the outputs:

- Exact definition of label: 1) how did you decide from the database what was a positive example and negative example. 2) over what time
- List of *all* features generated
- Model grid used: models and hyper-parameters. You can give the grid or a list of all model-hyperparameter combinations
- List of train/validation sets (table with the dates)
- The temporal graph of your primary evaluation metric  (precision at k)  for each validation set for all the models in the grid (line color by model type) - it's the slide from Update 5
- Criteria used to select top models (mean precision at k for example)
- For those top 5 models + smart baseline, please provide:
  - What are they
  - PR_k graphs of top models as well as
  - List of feature importance of *all* features
  - Cross-tabs for ~10 most different features
  - Bias metrics that are relevant to your problem scope

## Github Repo
The Github repo should be documented in two ways:

1. Instructions on the structure of the repository, what files are there, and how one should run your code (installing any packages for example)
1. The relevant code files should be documented.
 

# Evaluation Criteria

## Final Project Report

- Goals/Context:
  - The project has clear and actionable policy goals.
  - The use of this project in a policy setting is well described.
  - The project is well motivated and achieves the policy goals described.
  - Thoughtful consideration of balancing equity, efficiency, and effectiveness, as well as other potential ethical issues and mitigation strategies.
  - Previous work in this area is described and covered well.
- Data:
  - The data used is relevant for the problem, over a long enough period to solve this problem
  - Data exploration is described well
- Analysis: The analysis is done correctly and is evaluated appropriately
  - The machine learning models used are appropriate for the task and well-justified. All of the methods appropriate for the task and covered in class should be used.
  - The evaluation methodology is appropriate for the task and matches the operational use of this analysis/models.
  - Each training and validation set (and the generation process) is well described.
  - The correct metrics are being optimized for and optimizing for those metrics achieve the policy goals described.
- Results:
  - Evaluation results are described in detail for every train/validate set, metric, and models used
  - Performance is compared against a sensible baseline that reflects what a decision maker might do in the absence of a machine learning model.
  - The selection of the final model recommended for use is well described
  - The model interpretation is done well.
  - Models are audited for bias and fairness (motivated by the correct bias and fairness metrics and groups of interest) and results provided.
- Policy Recommendations and Field Trial Design:
  - Suggested field trial design is appropriate to assess both the performance of the model and impact of program outcomes, as well as accounting for potential nuances of feasibility or ethical constraints (e.g., withholding services, etc.)
  - Concrete and actionable policy recommendations are provided based on the results of the analysis
- Caveats:
  - Caveats of the project and recommendations are provided to a policy audience based on the limitations of the data and/or the analysis.
  - Future recommendations on how to improve the analysis are provided
- Appendix:
  - The additional information in the appendix is correct
  - The additional information in the appendix is correct supports and justifies the results provided in the report

## Code and Repo

- The repository is well-structured and well-documented.
- Usage and installation instructions are clear.
- Code is well-organized and documented.
- Code is reproducible, extensible, and modular.
