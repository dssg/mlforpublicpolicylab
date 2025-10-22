# Model and Hyperparameter Grid

You specify the types of models you want to explore, along with their hyperparameters, in the `grid_config` section of your yaml configuration file. Because there's generally no way to know a priori what model specification will work best for a given problem, `triage` makes it easy to run and explore an extensive grid by providing lists of values for each hyperparameter and training models for the full cross-product of these values.

Currently, `triage` can work with any classifiction method with an `sklearn`-style interface. In addition to machine learning algorithms found in standard packages, `triage` includes a couple of built-in methods you might find useful:
- `ScaledLogisticRegression` wraps the `sklearn`  logistic regression with a min-max scaler to ensure that the input features are on the same scale for regularization. It accepts the same hyperparameters as the underlying `sklearn` method.
- `BaselineRankMultiFeature` is a simple baseline method that ranks examples by one or more features, replicating a comonsense approach that could be taken without making use of machine learning. This method takes a single hyperparameter, `rules`, specified as a list of dictionaries with the keys `feature` and `low_value_high_score` to specify the directin of the ranking. Examples are sorted first by the first feature in this list, then the next, and so on.
- `SimpleThresholder` is another basic baseline method, allowing you to specify a heuristic, rule-based approach to classifying examples. It uses two hyperparameters: a list of `rules` (e.g., `feature_1 > 3`) and a `logical_operator` (e.g., `and` or `or`) to specify how the rules are combined.

To specify a model type in your grid config, you use the model's class path as a key and each hyperparameter as a key another level down. For example:
```
'module.submodule.ClassName':
    param_1: [1,3,5,10,20]
    param_2: [100, 500, 1000]
```

For our purposes here, we'll start with a very small grid that can run quickly in a colab notebook. Here's how that will look:
```
grid_config:
    'sklearn.ensemble.RandomForestClassifier':
        n_estimators: [150]
        max_depth: [50]
        min_samples_split: [25]
    
    'sklearn.tree.DecisionTreeClassifier':
        max_depth: [3]
        max_features: [null]
        min_samples_split: [25]
      
    'triage.component.catwalk.estimators.classifiers.ScaledLogisticRegression':
        C: [0.1]
        penalty: ['l1']
    
    'triage.component.catwalk.baselines.rankers.BaselineRankMultiFeature':
        rules:
            - [{feature: 'project_features_entity_id_all_total_asking_price_sum', low_value_high_score: False}]
```
