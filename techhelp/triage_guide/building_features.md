# Tips on Feature Creation in Triage

## Some example config files with feature definitions

1. [medical early warning system](https://github.com/dssg/ckdwarning/blob/main/triage_config_files/ckd_1yr.yaml)
2. [donors choose](https://github.com/dssg/donors-choose/blob/master/donors-choose-config.yaml)
3. [education project](https://github.com/dssg/el-salvador-mined-public/tree/master/experiments)
4. [hiv retention](https://github.com/dssg/hiv-retention-public/blob/master/pipeline_UCM/configs/ucm_triage3_retention.yml)

Keep in mind that some odf the examples above may use an earlier version of Triage so you may need to tweak the feature configs a little bit.


## creating typical categorical features
```
        categoricals_imputation:
            max:
              type: 'null_category'


            - # sex
                column: sex
                choice_query: select distinct sex from clean.demporaphics
                metrics: 
                  - max 

            - # urban/rural - using  a subset of values manually specified
                column: locality_type
                choices: [urban, rural]
                metrics:
                  - max  


    categoricals:
      - # top 50 diagnosis
        column: 'dx'
        choice_query: |
                SELECT DISTINCT dx
                        FROM (
                                SELECT dx,
                                        count(*)
                                  FROM clean.diagnosis
                                  GROUP BY dx order by count(*) desc limit 50
                            ) AS code_counts

        metrics:
          - 'max'
          - 'count'

```

## Creating "Age" feature
###  be careful about feature_start_date

```
  - # demographics
    prefix: 'demos'
    from_obj: |
          (select entity_id, sex,race,birth_date,zip_code,
          greatest(birth_date,'2011-01-01') as dob from clean.demographics) as dems
    knowledge_date_column: 'dob'

    aggregates:
      - # age in years
        quantity:
          age: "extract(year from age('{collate_date}'::date,  birth_date::date))"
        metrics:
          - 'max'
```

## Creating other temporal features


### days since last event

```
- 
  prefix: 'days_since'
  from_obj: "(SELECT * FROM staging.entity_all_events) AS events"
  knowledge_date_column: 'event_date'
  aggregates:
  
    - # days since last event
      quantity:
        last_event: "'{collate_date}'::DATE - event_date"
      metrics: ['min']



    - # days since last event of a certain type
      quantity:
        last_event_of_type_X: case when event_type='X' then ('{collate_date}'::DATE - event_end_date::DATE) end
  metrics:
      metrics: ['min']

  intervals: ['50y']


```




