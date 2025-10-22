As noted above, `triage` is designed for problems where the desire to generalize to future data and therefore is careful to respect the temporal nature of the problem. This is particularly salient in two places: defining the validation strategy for model evaluation and ensuring that features only make use of information available at the time of analysis/prediction.

For validation, the idea is generally simple: models should be trained on historical data and validated on future data. As such, `triage` constructs validation splits that reflect this process by using a certain point in time as the cut-off between training and validation and then moving this cut-off back through the data to generate multiple splits. The implementation is a bit more complicated and relies on several parameters, the details of which we won't go deep into here, but you can find a much deeper discussion in the [longer "dirty duck" tutorial](https://dssg.github.io/triage/dirtyduck/triage_intro/) as well as in the [experiment config docs](https://dssg.github.io/triage/experiments/experiment-config/).

![temporal figure](https://dssg.github.io/triage/experiments/temporal_config_graph.png)

In short, these parameters are (illustrated across three training/validation splits in the figure above):
- feature start/end times: what range of history is feature information available for?
- label start/end times: what range of history is outcome (label) data available for?
- model update frequency: what is the interval between refreshes of the model?
- test durations: over what time period will the model be in use for making predictions?
- max training history: how much historical data should be used for model training (that is, for rows/examples)?
- training/test as_of_date frequencies: within a training or validation (test) set, how frequently should cohorts be sampled?
- training/test label timespans: over what time horizon are labels (outcomes) collected?

As with the cohorts and labels, these parameters are specified to `triage` via its yaml configuration file. Here's what this will look like for our setting:
```
temporal_config:

    # first date our feature data is good
    feature_start_time: '2000-01-01'
    feature_end_time: '2013-06-01'

    # first date our label data is good
    # donorschoose: as far back as we have good donation data
    label_start_time: '2011-09-02'
    label_end_time: '2013-06-01'

    model_update_frequency: '4month'

    # length of time defining a test set
    test_durations: ['3month']
    # defines how far back a training set reaches
    max_training_histories: ['1y']

    # we sample every day, since new projects are posted
    # every day
    training_as_of_date_frequencies: ['1day']
    test_as_of_date_frequencies: ['1day']
    
    # when posted project timeout
    label_timespans: ['3month']
```
