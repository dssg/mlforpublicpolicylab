Triage is designed for problems where the desire to generalize to future data and therefore is careful to respect the temporal nature of the problem. 
This is particularly salient in two places: defining the validation strategy for model evaluation and ensuring that features only make use of information available at the time of analysis/prediction.

For validation, the idea is generally simple: models should be trained on historical data and validated on future data. As such, triage constructs validation splits that reflect this process by using a certain point in time as the cut-off between training and validation and then moving this cut-off back through the data to generate multiple splits. The implementation is a bit more complicated and relies on several parameters, the details of which we won't go deep into here, but you can find a much deeper discussion in the longer "dirty duck" tutorial as well as in the experiment config docs.


In short, these parameters are (illustrated across three training/validation splits in the figure above):

feature start/end times: what range of history is feature information available for? (comes from your data)

label start/end times: what range of history is outcome (label) data available for? (comes from your data)

model update frequency: what is the interval between refreshes of the model? (comes from your formulation)

test durations: over what time period will the model be in use for making predictions? 

max training history: how much historical data should be used for model training (that is, for rows/examples)? (default to the entire history)

training/test as_of_date frequencies: within a training or validation (test) set, how frequently should cohorts be sampled? (test as_of_date frequencies comes from your formulation)

training/test label timespans: over what time horizon are labels (outcomes) collected? (comes from your formulation)

As with the cohorts and labels, these parameters are specified to triage via its yaml configuration file. Here's what this will look like for our setting:
