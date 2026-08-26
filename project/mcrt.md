# JoCo Mental Health Center

## The Organization
[Johnson County](https://www.jocogov.org/) (JoCo) is the most populous county in the state of Kansas, primarily consisting of the suburbs of Kansas City, MO. The county's Mental Health Center (MHC) provides a variety of services, including counseling, crisis help lines, inpatient care, criminal justice co-responders, and a mobile crisis response team (MCRT) that does outreach in the community.


## The Problem
Untreated mental health conditions often result in a negative spiral, which can culminate in repeated periods of incarceration with long term consequences both for the affected individual and the community as a whole. Surveys of inmate populations have suggested a high prevalence of multiple and complex needs, with 64% of people in local jails suffering from mental health issues and 55% meeting criteria for substance abuse or dependence, and three times as many individuals with serious mental illness housed in jails and prisons as hospitals. Despite these high levels of need, the criminal justice system is poorly suited to address them, contributing to a worsening of this spiral. Johnson County's Mental Health Center currently seeks to identify individuals with behavioral health needs in this population by screening people who enter the county jail.


## Goals and Interventions
The JoCo MHC hopes break this cycle of incarceration by identifying individuals who might benefit from outreach with mental health resources and are at risk for future incarceration. While the center currently provides services to the jail population, needs are generally identified reactively, for instance through screening instruments individuals fill out when entering jail. The new program being developed will supplement these existing approaches with proactive outreach by case workers, with the hope that individuals can be provided with care before a crisis develops that results in a return to jail. However, they only have limited resources for this new proactive outreach effort and estimate that their current level of budget and staffing will only allow them to attempt to contact 100 individuals each month.


## The Data
Through our partnership, the county provided administrative data from their mental health center, jail system, police arrests, and ambulance runs, which have been loaded into a database for your project. In the database, the table `raw.jocojococlient` contains information matching records across different systems (done by JoCo). The `joid` column provides the resulting match id, while `source` indicates the system and column the record came from. The `sourceid` or `hash_sourceid` column provides the join key back into each system. Note that only one may be populated depending on the data type and nature of the key.

Johnson County has provided data from several systems:
- **JCDHE**: Johnson County Department of Health encounter data
- **KDOC**: Kansas Dept. of Corrections (state-level), including some probation data
- **AIMS**: Automated Information Mapping System: public jail booking information
- **JIMS**: Justice Information Management System: County-level jail and inmate information
- **MEDACT**: First responder data, including ambulance runs
- **JCMHC**: Johnson County Mental Health Center data
- **PD**: Police department arrest data

A number of tables have been provided with some initial data-processing and cleaning performed (in the `cleaned` schema) while several others are available in their raw form (in the `raw` schema).

A few notes to keep in mind as you work with the data:
- Many tables include a `joco_resident` flag that was added later to code whether the individual associated with the record was a resident of johnson county at the time based on information associated with the record.
- The JCMHC data contains information only about individuals who have interacted with the mental health center or one of its programs.
- The JCDHE data includes information about several types of encounters, not just ones related to mental health.
- In the JCDHE data, the `cosite` column indicates the location of the event: 14005 indicates Olathe (zipcode 66061) and 14012 indicates Mission (zipcode 66202)
- Jail inmates will be given a couple of screens that provide information on mental health status:
    - The ["Brief Jail Mental Health Screen" (BJMHS)](https://www.prainc.com/wp-content/uploads/2015/10/bjmhsform.pdf), which has 8 questions. Data is in `cleaned.jocojimsinmatedata` as columns `mhs1`-`mhs8`, as well as `mhs_total` and `bjmhs_referred` to indicate whether the inmate was referred to JCMHC for mental health servises on the basis of the results.
    - The "Level of Service Inventory - Revised" (LSI-R), a 54-item inventory across a wide range of areas relevant to risk levels and treatment needs. You can find these data in `cleaned.jims_lsir_records` and JoCo uses the following logic to assess mental health need: a value of 1 in any of `ans_37`-`ans_50` or a value of 0 in `ans_39` or `ans_40`. The total LSI-R score will be in either the `total_score` or `score` column.
    - Additionally, the pre-trial assessment information in `cleaned.jocojimspretrialassessdata` includes `assessment_mh_flag` and `substance_flag` columns to indicate whether a mental health need or substance abuse issue was identified at the time of the assessment.
- In the MED-ACT data, you'll find text columns indicating the complaint that led to the response (`chiefcomplaint`) as well as the impressions of the first responders (`primaryimpression` and `secondaryimpression`)
- There are several datetime columns in the MEDACT data incidating several steps in the process of the ambulance run.


### A few other resouces
- [Adult Criminal Process in Johnson County](joco_docs/joco_crimpro.pdf)
- [Some Acronyms](joco_docs/joco_acronyms.pdf)
- [JCMHC services overview](joco_docs/joco_services.pdf)
