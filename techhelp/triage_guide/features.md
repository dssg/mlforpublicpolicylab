# Generating Features in Triage
## [Common Feature Recipes](https://dssg.github.io/triage_cookbook/features.html)
## Quick Overview

Feature generation is typically the most important aspect of how well your machine learning models will work, so `triage` provides considerable flexibility for feature definition. However, this also means that this section of the configuration file can be particularly complicated and may require some experimentation to get familiar with. A few resources may be helpful for a deeper look at how features work in `triage`:
- [Feature Definition in the Quickstart Guide](https://dssg.github.io/triage/triage_project_workflow/#define-some-additional-features)
- [Feature Generation in the triage Documentation](https://dssg.github.io/triage/experiments/experiment-config/#feature-generation)
- [Features in the Example Configuration File](https://github.com/dssg/triage/blob/master/example/config/experiment.yaml#L102)

Features in `triage` are defined in blocks, grouping together features drawn from the same data source and allowing several related features to be constructed in a very compact format. Each of these blocks is a list item under the `feature_aggregations` section of your yaml configuration file and contains the following information:
- A `prefix` that is used to identify the group of features.
- A `from_obj` that specifies the underlying information used to construct the features in this group. This can be either a table or a query in itself (in the later case, be sure to give it an alias) and must contain both an `entity_id` column as well as a date column indicating when the information was known, identified to the feature config as the `knowledge_date_column`.
- Information about how missing values should be imputed (see the documentation for details and available options here).
- Definitions of the feature quantities/columns themselves, specified either as `aggregates` or `categoricals`, including the `metrics` for aggregations over time (e.g., `sum`, `max`, `avg`, etc).
- Time ranges over which to calculate feature information, called `intervals` (e.g., last 6 months, last 5 years, etc.)
- A level of aggregation for feature information (`groups`) -- this will almost always be just `entity_id`.

🚧 &nbsp;&nbsp;NOTE: All features in `triage` are temporal aggregates. Just as `triage` is designed to carefully account for time in temporal cross-validation, it also does so in feature construction focusing on what information was known at training or validation time. Even features you might generally consider "static" need to be associated with a knowledge date for these purposes as well as an aggregation metric. This is also true for categoricals, which are first one-hot encoded from each instance then aggregated over the given time interval with the specified metric. For instance, if a patient has had several hospital stays with different primary diagnosis codes at each stay, a categorical feature using a `sum` aggregation would yield a count of how many stays had a given diagnosis while a `max` aggregation would provide an indicator of whether a given diagnosis was ever present. 

For aggregations of numeric features, the resulting feature names will have the format: 
`{prefix}_entity_id_{interval}_{quantity}_{metric}`

For categoricals, the feature names will include each categorical value after one-hot encoding:
`{prefix}_entity_id_{interval}_{quantity}_{value}_{metric}`

🚧 &nbsp;&nbsp;WARNING: Because `triage`'s features are stored in a `postgres` database, this naming convention can sometimes run afoul of the database's 63 character limit for column names, leading to truncation. When this happens, you might encounter errors indicating a given feature column appears to be missing. This can be common with categoricals with particularly long values, so recoding can be useful in those cases (as can choosing shorter prefix names).

For illustrative purposes here, we'll start with a single feature group including one categorical and continuous aggregate feature: the primary resource type for the project and the amount being asked for. Because these are both specified once at project posting time, we simply aggegate them over all time (that is, using `all` for our `interval`). Here's how we specify this in our feature configuration:

```
feature_aggregations:
  -
    prefix: 'project_features'
    from_obj: 'data.projects'
    knowledge_date_column: 'date_posted'

    aggregates_imputation:
      all:
        type: 'zero'

    categoricals_imputation:
      all:
        type: 'null_category'          

    categoricals:
      -
        column: 'resource_type'
        metrics:
          - 'max' 
        choice_query: 'select distinct resource_type from data.projects'
    
    aggregates:
      -
        quantity: 'total_asking_price'
        metrics:
          - 'sum'
      
    # Since our time-aggregate features are precomputed, feature interval is 
    # irrelvant. We keep 'all' as a default.
    intervals: ['all'] 
    groups: ['entity_id']
```
