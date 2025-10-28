# What happens after a Triage run finishes
## Objects stored on disk

Two types of objects will be stored to disk in the `project_path` specified in creating the experiment object:
- The matrices used for model training and validation, stored as CSV files and associated metadata in yaml format.
- The trained model objects themselves, stored as `joblib` pickles, which can be loaded and applied to new data.

## Intermediate artifacts and results stored in the database

### [Common recipes for looking at results](https://dssg.github.io/triage_cookbook/looking_for_results.html)

### Quick overview
In the database, `triage` will store results and metadata in several tables. Below is a very brief tour of the most important of these tables.

In the **triage_metadata** schema, you'll find information about your run and the models that were created:
- `triage_metadata.triage_runs`: metadata about every time `triage` is run, identified by a `run_id`
- `triage_metadata.experiments`: configuration information for an experiment, identified by an `experiment_hash`. Note that a config file can be run multiple times, so a specific experiment might be associated with multiple `triage_runs` records. The `experiment_hash` can be linked to the `run_hash` in the `triage_runs` table where `run_type='experiment'`
- `triage_metadata.model_groups`: in `triage` a `model_group` represents a full specification of a model type, set of hyperparameters, set of features, and training set parameters
- `triage_metadata.models`: a `model` represents the application of a `model_group` to a given training set, yielding a set of trained parameters (such as the coefficients of a logistic regression, the splits of a decision tree, etc). The models are identified by both a `model_id` and `model_hash` and can be linked to their `model_group` via the `model_group_id`
- `triage_metadata.experiment_models`: the association between models and experiments (linking an `experiment_hash` to a `model_hash`)

In the **test_results** schema, you'll find information about the validation performance of the models:
- `test_results.evaluations`: performance of each model on the metrics specified in the `scoring` section of your configuration file
  - The `metric` column tells you the type of metric being calculated (e.g., roc_auc, precision@, etc.)
  - `parameter` tells you which specific value of a metric you're looking at, so metric="precision@" and parameter="50_abs" is the precision in the top 50 cases sorted by prediction score. "50_pct" would be the precision in the top 50% of cases
  - Many metrics involve thresholding predictions. When prediction scores are bunched (i.e., there are more than 50 cases with the maximum score), ties are broken in a variety of ways:
    - `worst_value` - Ordering by the label ascending. This has the effect of as many predicted negatives making it above thresholds as possible, thus producing the worst possible score.
    - `best_value` - Ordering by the label descending. This has the effect of as many predicted positives making it above thresholds as possible, thus producing the best possible score.
    - `stochastic_value` - If the worst_value and best_value are not the same (as defined by the floating point tolerance at catwalk.evaluation.RELATIVE_TOLERANCE), the sorting/thresholding/evaluation will be redone many times, and the mean of all these trials is written to this column. Otherwise, the worst_value is written here
    - `num_sort_trials` - If trials are needed to produce the stochastic_value, the number of trials taken is written here. Otherwise, this will be 0
    - `standard_deviation` - If trials are needed to produce the stochastic_value, the standard deviation of these trials is written here. Otherwise, this will be 0
  - `matrix_uuid` tells you which matrix was used to make predictions, which is particularly helpful when you want to see performance for a specific time period
  - `model_id` should be unique to the specific model that was fit and used to make those predictions. You can use this to join to triage_metadata.models, where you'll have more information on what type of model that is. For example, if you want to see performance for all baseline models, you can join the two tables and filter to `model_type = 'triage.component.catwalk.baselines.rankers.BaselineRankMultiFeature'` 
- `test_results.predictions`: individual entity-level predicted scores from each model
- `test_results.prediction_metadata`: metadata associated with the predictions
- `test_results.aequitas`: performance of each model on the fairness metrics using the parameters specified in your `bias_audit_config`

In the **train_results** schema, you'll find model performance on the training set, as well as feature importances:
- `train_results.evaluations`: similar to `test_results.evaluations` but for the training set (often may be overfit, but can be useful for debugging)
- `train_results.predictions`: similar to `test_results.predictions` but for the training set
- `train_results.prediction_metadata`: metadata associated with the predictions
- `train_results.feature_importances`: overall feature importances from model training, using the built-in method for the classifier (if one exists)

Finally, a few intermediate tables can be particularly useful for debugging:
- Tables containing your `cohort` and `label` will be generated in the `public` schema and identified by an associated hash that can be found in your logs.
- The `features` schema contains two types of useful tables: tables containing calculated features for each feature group and "matrix" tables that provide the mapping from each training/validation matrix to `(entity_id, as_of_date)` pairs. Note, however, that these tables may be overwritten if a new run is performed with different feature logic, cohort, or underlying data and should not be assumed to be persistent across runs.
