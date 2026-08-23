# Syllabus — Fall 2026

[← Back to course home](README.md) · [Schedule](schedule.md) · [Project](project.md) · [Policies](policies.md)

Below is the week-by-week plan, including the readings assigned for each week. **Please read and be prepared to discuss the required readings before the specified class session.**

Most of these topics can be (and often are) the focus of entire courses. We'll generally only scratch the surface, but hopefully inspire you to go deeper in areas that interest you — you'll find plenty of open research questions in each. Optional readings are listed for most sessions for students who want to delve deeper, and often provide useful context for related project work.

Readings marked 🔒 require CMU credentials or an institutional subscription. Readings with a PDF in this repo are linked directly.

---

## Week 1 — Introduction and project scoping
*Aug 25, 26, 27*

**Tuesday: [Intro and overview](Lectures/01-ClassOverview.pptx)**

An introduction to the class, its goals, and an overview of the project options to help you decide what you're interested in working on for the semester.

**Thursday: [Scoping, problem definition, and balancing goals](Lectures/02-Scoping.pptx)**

Well before the outset of technical work, a decision needs to be made about whether a given policy problem can and should be addressed with machine learning: is the problem significant, feasible to solve with a technical approach, and of sufficient importance to policymakers that they will devote resources to implementing the solution? How will success be measured? How will the often-competing goals of efficiency, effectiveness, and equity be balanced?

**Required (Thursday):**
- *Data Science Project Scoping Guide.* [Online](https://datasciencepublicpolicy.org/our-work/tools-guides/data-science-project-scoping-guide/)
- Kumar, A., Rizvi, S.A.A., et al. *Using Machine Learning to Assess the Risk of and Prevent Water Main Breaks.* KDD 2018. [PDF](Readings/PDF/KumarWaterMains.pdf)

**Optional:**
- Hand, D.J. *Deconstructing Statistical Questions.* J. Royal Stat. Soc. A 157(3), 1994. [Online](https://www.jstor.org/stable/pdf/2983526.pdf) 🔒

**Friday: [Tech session — basic setup](techsessions/session1.md)**

We'll make sure everyone can connect to the server over ssh, has GitHub access, and can reach the database from both psql and DBeaver.

---

## Week 2 — Case studies and acquiring data
*Sep 1, 2, 3*

This week we'll organize groups and begin project work.

**Tuesday: [Case studies](Lectures/03-casestudies.pptx)**

Practical examples are a great way to understand the nuance of applying machine learning to policy problems. Tuesday is a class discussion of a recent application, scoping the case together in breakout groups.

**Required (Tuesday):**
- Rehman, N.A., et al. *Fine-grained dengue forecasting using telephone triage services.* Sci. Adv. 2016. [PDF](Readings/PDF/RehmanDengue.pdf)

**Wednesday: [Tech session — remote workflows](techsessions/remote-session2.md)**

A workshop on the remote workflow tools you'll use for your project.

**Thursday: [Acquiring data, privacy, and record linkage](Lectures/04-data.pptx)**

Acquiring data from a project partner is often an involved process with legal and technical dimensions. Researchers need to understand how the data may and may not be used (typically formalized in a data use agreement as well as underlying law) and ensure the privacy of individuals in the dataset is protected, through both access restrictions and techniques like anonymization. Once acquired, data often needs to be transformed for ingest, linked across sources, and structured for analysis. We'll also spend some time on working effectively with your project team.

**Optional:**
- Potash, E., et al. *Predictive Modeling for Public Health: Preventing Childhood Lead Poisoning.* KDD 2015. [Online](http://www.dssgfellowship.org/wp-content/uploads/2016/01/p2039-potash.pdf)
- Lecher, C. *What Happens When an Algorithm Cuts Your Health Care.* The Verge, 2018. [Online](https://www.theverge.com/2018/3/21/17144260/healthcare-medicaid-algorithm-arkansas-cerebral-palsy)
- Ohm, P. *Broken Promises of Privacy.* UCLA Law Review, 2009. Introduction and Section 1. [Online](https://heinonline.org/HOL/Page?handle=hein.journals/uclalr57&div=48&collection=journals) 🔒
- Christen, P. *Data Matching.* Springer, 2012. Chapter 2: The Data Matching Process. [Online](https://link.springer.com/book/10.1007/978-3-642-31164-2) 🔒
- Foster, Ghani, et al. (eds). *Big Data and Social Science.* Chapter 4: Databases. [Online](https://textbook.coleridgeinitiative.org/)

---

## Week 3 — Data exploration and teamwork
*Sep 8, 9, 10*

Project work this week should include continuing to develop and refine your scope as you begin to explore the data.

**Tuesday: [Data exploration](Lectures/06-data-exploration.pptx)**

An overview of exploratory data analysis, particularly with downstream ML in mind. Data exploration is fundamental to understanding the nuances of the data and how the policy problem you initially scoped can be formulated as a machine learning problem. This involves generating and plotting summary statistics, exploring trends over time, understanding rapid changes in distributions, and identifying missing data and outliers. Typically it should involve considerable input from domain experts as you develop an understanding of how the data relates to the underlying generative process, as well as its idiosyncrasies and limitations.

We'll also set aside about 30 minutes on Tuesday for you to meet with your project team and discuss your scope.

**Wednesday: [Tech session — git and GitHub](https://docs.google.com/presentation/d/1qIlxS9vJdAgsu-CJK-bx1tTg4p_y0mYfokDyHJRhfAI/edit)**

A tutorial and refresher on using GitHub for your project.

**Thursday: Project work** — data exploration, scoping, and proposal planning.

---

## Week 4 — Analytical formulation, baselines, and ML pipelines
*Sep 15, 16, 17*

> 📌 **Due Tuesday, Sep 15: [project proposal](project.md#1-project-proposal) with scope and descriptive statistics**

**Tuesday: [Analytical formulation and baselines](Lectures/07-formulation-and-baselines.pptx)**

Distinct from initial scoping, a true analytical formulation of your policy problem can only come after you understand the data at hand — which in turn usually produces a better understanding of the problem itself. Here you'll ask how specifically your target variable (if relevant) is defined in the data, what types of information are available as predictors, and what baseline you'll measure performance against. Very rarely is the appropriate baseline as simple as random choice or the population prevalence. Rather, it should reflect what would be expected to happen otherwise: perhaps a simple decision rule an expert would come up with, or a pre-existing statistical model the current effort seeks to replace.

**Required (Tuesday):**
- Obermeyer, Z., Powers, B., et al. *Dissecting Racial Bias in an Algorithm Used to Manage the Health of Populations.* Science, 2019. [PDF](Readings/PDF/ObermeyerBias.pdf)
- Passi, S. and Barocas, S. *Problem Formulation and Fairness.* FAT\* 2019. [Online](https://arxiv.org/pdf/1901.02547.pdf)

**Optional:**
- Ameisen, E. *Always Start with a Stupid Model, No Exceptions.* [Online](https://blog.insightdatascience.com/always-start-with-a-stupid-model-no-exceptions-3a22314b9aaa)
- Ramakrishnan, S. *Create a Common-Sense Baseline First.* [Online](https://towardsdatascience.com/first-create-a-common-sense-baseline-e66dbf8a8a47) 🔒
- Provost, F. and Fawcett, T. *Data Science for Business.* O'Reilly, 2013. Chapter 2: Business Problems and Data Science. [Online](https://learning.oreilly.com/library/view/data-science-for/9781449374273/ch02.html) 🔒

**Wednesday: [Tech session — Python and SQL](techsessions/python_sql_tech_session.ipynb)**

**Thursday: [Building ML pipelines](Lectures/09-Machine-Learning-Pipelines.pptx)**

End-to-end ML pipelines can quickly become unwieldy with several moving pieces, and well-structured, modular code is often critical to detecting and fixing bugs. This session gives an overview of the pipeline, each underlying element, and some best practices for building them.

**Optional:**
- Koen, S. *Architecting a Machine Learning Pipeline.* [Online](https://towardsdatascience.com/architecting-a-machine-learning-pipeline-a847f094d1c7) 🔒
- Hermann, J. and Del Balso, M. *Meet Michelangelo: Uber's Machine Learning Platform.* [Online](https://eng.uber.com/michelangelo/)

---

## Week 5 — Choosing performance metrics & evaluating classifiers, part 1
*Sep 22, 23, 24*

> 📌 **Due Tuesday, Sep 22: [peer reviews](project.md#2-proposal-peer-reviews) of three project proposals**

Pipeline development should continue this week, with a focus on producing the simplest possible version of the full system.

**Tuesday: [Choosing metrics](Lectures/10-model-selection-and-validation-part-1.pptx)**

In most cases, a vast array of methods — each with tunable hyperparameters — can be brought to bear on your modeling question. How do you decide which models are better than others, and how can you be confident that decision carries forward when the model is deployed? How should you balance performance and fairness in these decisions? Are models performing similarly well giving similar predictions, and what should you do if they aren't? We start with the choice of performance metrics.

**Required (Tuesday):**
- *The Misuse of AUC: What High Impact Risk Assessment Gets Wrong.* [Online](https://arxiv.org/abs/2305.18159)

**Optional:**
- Stapor, K. *Evaluating and Comparing Classifiers.* CORES 2017. [PDF](Readings/PDF/StaporEvaluating.pdf)

**Wednesday: Tech session — triage configuration**

An introduction to `triage`, the ML pipeline toolkit we use for the class project. See also the [triage documentation](https://dssg.github.io/triage/).

**Thursday: Project work**

---

## Week 6 — Choosing performance metrics & evaluating classifiers, part 2
*Sep 29, 30, Oct 1*

By this week, your group should have a very simple version of an end-to-end pipeline with preliminary results for a single model specification.

**Tuesday: [Model selection and validation](Lectures/10-model-selection-and-validation-part-2.pptx)**

Continuing from last week, we focus on validation strategies that reflect how you want your model to generalize — in particular, the common case of modeling contexts with a strong temporal component where predicting into the future is the goal, and how your choice of training and validation sets should reflect that.

**Required (Tuesday):**
- Roberts, D.R., Bahn, V., et al. *Cross-validation strategies for data with temporal, spatial, hierarchical, or phylogenetic structure.* Ecography 40, 2017. [PDF](Readings/PDF/RobertsCV.pdf)
- *Amazing Things Come From Having Many Good Models.* [Online](https://arxiv.org/pdf/2407.04846)

**Optional:**
- Cochrane, C. *Time Series Nested Cross-Validation.* [Online](https://towardsdatascience.com/time-series-nested-cross-validation-76adba623eb9) 🔒
- Rudin, C. and Carlson, D. *The Secrets of Machine Learning.* arXiv:1906.01998, 2019. [Online](https://arxiv.org/abs/1906.01998)
- Foster, Ghani, et al. (eds). *Big Data and Social Science*, 2nd ed. Chapter 7: Machine Learning. [Online](https://textbook.coleridgeinitiative.org/chap-ml.html)

**Wednesday: Check-ins begin.** Regular team check-ins start this week to give feedback on project progress.

**Thursday: Temporal validation deep dive** — we meet together as a class to work through temporal validation using a few class project examples.

---

## Week 7 — Feature engineering and imputation
*Oct 6, 7, 8*

In many real-world contexts, expressing domain expertise through thoughtful feature engineering can dramatically improve model performance by capturing what underlying factors are likely to be predictive and helping the model find these relationships. Likewise, most datasets you'll encounter in practice are littered with outliers, inconsistencies, and missingness, and handling these in a smart way can be critical to a project's success.

**Tuesday: [Feature engineering and imputation](Lectures/12-features-and-imputation.pptx)**

**Required (Tuesday):**
- [Short video lecture](https://www.youtube.com/watch?v=kluqz_1GN5c) and the [corresponding slides](Lectures/12-features-and-imputation.pptx)

**Optional:**
- Akinfaderin, W. *Missing Data Conundrum.* [Online](https://medium.com/ibm-data-science-experience/missing-data-conundrum-exploration-and-imputation-techniques-9f40abe0fd87) 🔒
- Zhang, A. and Casari, A. *Feature Engineering for Machine Learning.* O'Reilly, 2018. Chapter 2: Fancy Tricks with Simple Numbers. [Online](https://learning.oreilly.com/library/view/feature-engineering-for/9781491953235/) 🔒
- Gelman, A. *Missing-data imputation.* [PDF](http://www.stat.columbia.edu/~gelman/arm/missing.pdf)

**Wednesday: Check-ins**

**Thursday: Project work**

---

## Fall break — no classes
*Oct 13, 14, 15*

---

## Week 8 — Feature engineering in triage
*Oct 20, 21, 22*

> 📌 **Due Monday, Oct 19: modeling plan and temporal validation configuration**

This week we get concrete about translating the feature ideas from week 7 into `triage` configuration: how features are specified, how aggregations over time and entity are defined, and how imputation is handled in the pipeline.

**Tuesday: [Features and imputation slides](Lectures/12-features-and-imputation.pptx)** and the **[triage features cookbook](https://dssg.github.io/triage_cookbook/configure/features.html)**

**Wednesday: Check-ins**

**Thursday: Triage office hours and Q&A**

---

## Week 9 — ML modeling in practice
*Oct 27, 28, 29*

> 📌 **Due Monday, Oct 26: V0 baseline results and planned feature list**

Pipeline development and refinement should continue this week with a widening set of model specifications and features to explore.

**Tuesday: [ML modeling in practice](Lectures/14-ml-modeling-in-practice.pptx)**

Practical guidance on building ML models for real-world projects: how should you think about what types of models to build? What hyperparameters should you explore, and how do you design a hyperparameter grid?

**Required (Tuesday):**
- Riley, P. *Three Pitfalls to Avoid in Machine Learning.* Nature 527, 2019. [PDF](Readings/PDF/RileyPitfalls.pdf)
- Ghani, R., et al. *Top 10 Ways Your Machine Learning Models May Have Leakage.* DSSG Blog. [Online](http://www.dssgfellowship.org/2020/01/23/top-10-ways-your-machine-learning-models-may-have-leakage/)

**Optional:**
- Provost, F. and Fawcett, T. *Data Science for Business.* Chapter 5: Overfitting and Its Avoidance. [Online](https://learning.oreilly.com/library/view/data-science-for/9781449374273/ch05.html) 🔒
- Kaufman, S., Rosset, S., et al. *Leakage in Data Mining.* TKDD, 2011. [Online](https://dl.acm.org/doi/10.1145/2382577.2382579) 🔒
- Gonfalonieri, A. *Why is Machine Learning Deployment Hard?* [Online](https://towardsdatascience.com/why-is-machine-learning-deployment-hard-443af67493cd) 🔒
- Kervizic, J. *Overview of Different Approaches to Deploying Machine Learning Models in Production.* KDnuggets. [Online](https://www.kdnuggets.com/2019/06/approaches-deploying-machine-learning-production.html)

**Wednesday: Check-ins**

**Thursday: Project work**

---

## Week 10 — Choosing performance metrics & evaluating classifiers, part 3
*Nov 3, 4, 5*

> 📌 **Due Monday, Nov 2: V0 modeling results** — updated validation splits, features, and baseline results.

**Tuesday: No class (Election Day)**

**Wednesday: Check-ins**

**Thursday: [Model selection, part 3](Lectures/15-ml-in-practice-and-model-selection-part-3.pptx)**

We return to model selection, digging into how to winnow a large number of model specifications down to one or a handful that perform "best" for some definition of best. We focus on the common case of ML problems with a strong time-series component and the desire to balance performance and stability in model selection.

---

## Week 11 — Model interpretability and ethics
*Nov 10, 11, 12*

> 📌 **Due Monday, Nov 9: weekly project update**

By this week, project work should begin to focus more heavily on evaluation, model selection, and interpretation.

**Tuesday: [Model interpretability](Lectures/16-interpretability-part-1.pptx)**

Model interpretability can be thought of at two levels: global (how the model works in aggregate) and local (why an individual prediction came out as it did). We focus on practical aspects and applications at both levels: understanding how a model performs globally, what it means to compare that performance across specifications, how these methods help researchers debug and improve models, how they build trust among stakeholders (including a growing legal movement toward a "right to explanation"), how they help those acting on predictions know when to override the model with their judgment, and — importantly — how they help decide not only *whom* to intervene on but *what* intervention to take.

**Required (Tuesday):**
- Amarasinghe, K., Rodolfa, K., Lamba, H., and Ghani, R. *Explainable Machine Learning for Public Policy: Use Cases, Gaps, and Research Directions.* Data & Policy 5, 2023. [Online](https://arxiv.org/abs/2010.14374)
- Lundberg, S.M., Nair, B., et al. *Explainable machine-learning predictions for the prevention of hypoxaemia during surgery.* Nature Biomed. Eng., 2018. [PDF](Readings/PDF/LundbergHypoxaemia.pdf)

**Optional:**
- Caruana, R., et al. *Intelligible Models for HealthCare: Predicting Pneumonia Risk and Hospital 30-day Readmission.* KDD 2015. [PDF](Readings/PDF/CaruanaGAM.pdf)
- Ribeiro, M.T., Singh, S., and Guestrin, C. *Why Should I Trust You? Explaining the Predictions of Any Classifier.* KDD 2016. [PDF](Readings/PDF/RibeiroLIME.pdf)
- Rudin, C. and Ustun, B. *Optimized Scoring Systems: Toward Trust in Machine Learning for Healthcare and Criminal Justice.* INFORMS Journal on Applied Analytics, 2018. [Online](https://pubsonline.informs.org/doi/pdf/10.1287/inte.2018.0957) 🔒
- Zeng, J., Ustun, B., and Rudin, C. *Interpretable Classification Models for Recidivism Prediction.* J. Royal Stat. Soc. A, 2016. [Online](https://rss.onlinelibrary.wiley.com/doi/pdf/10.1111/rssa.12227) 🔒
- Plumb, G., Molitor, D., and Talwalkar, A.S. *Model Agnostic Supervised Local Explanations.* NeurIPS 2018. [Online](http://papers.nips.cc/paper/7518-model-agnostic-supervised-local-explanations)
- Lundberg, S.M. and Lee, S. *A Unified Approach to Interpreting Model Predictions.* NeurIPS 2017. [Online](http://papers.nips.cc/paper/7062-a-unified-approach-to-interpreting-model-predictions)
- Lundberg, S.M., Erion, G., et al. *Explainable AI for Trees.* arXiv:1905.04610. [Online](https://arxiv.org/pdf/1905.04610.pdf)

**Wednesday: Check-ins**

### Ethics workshop (Thursday)

**[Ethics workshop slides](Lectures/EthicsOverview.pptx)** — a workshop discussion of ethical issues in designing ML systems.

---

## Week 12 — Bias and fairness
*Nov 17, 18, 19*

> 📌 **Due Monday, Nov 16: weekly project update** — feature importances and crosstabs.

By this week you should be finalizing your modeling results and beginning to look at bias and disparities in your models.

**Tuesday: [Dealing with bias and fairness in ML](Lectures/bias-fairness-overview.pptx)**

Just as important as assessing whether your model is making accurate predictions is determining whether it is doing so fairly. But what do we mean by fairness? How can you measure it, and what can you do to mitigate disparities you find? Where in your pipeline can bias be introduced? (Spoiler: everywhere.) This week is a brief introduction to the expansive field of algorithmic fairness.

**Required (Tuesday):**
- Verma, S. and Rubin, J. *Fairness Definitions Explained.* [PDF](Readings/PDF/VermaFairnessDefn.pdf)
- Rawls, J. *A Theory of Justice*, 1971. Chapter 1: Justice as Fairness, pp. 1–19. [PDF](Readings/PDF/RawlsJustice.pdf)
- Huq, A. *Racial Equity in Algorithmic Criminal Justice.* Duke Law Journal, 2018. [PDF](Readings/PDF/HuqRacialEquity.pdf) — focus on sections I.B.2, all of section II, the section III introduction, III.B, and III.D.3.

**Optional:**
- Chouldechova, A., Putnam-Hornstein, E., et al. *A case study of algorithm-assisted decision making in child maltreatment hotline screening decisions.* PMLR 2018. [PDF](Readings/PDF/ChouldechovaFosterCare.pdf)
- Rodolfa, K.T., et al. *Case study: predictive fairness to reduce misdemeanor recidivism through social service interventions.* FAT\* 2020. [Online](https://arxiv.org/pdf/2001.09233)
- Bent, J.R. *Is Algorithmic Affirmative Action Legal?* Georgetown Law Journal, 2019. [Online](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3372690)
- Lipton, Z., McAuley, J., and Chouldechova, A. *Does Mitigating ML's Impact Disparity Require Treatment Disparity?* NeurIPS 2018. [Online](http://papers.nips.cc/paper/8035-does-mitigating-mls-impact-disparity-require-treatment-disparity)
- Roemer, J.E. and Trannoy, A. *Equality of Opportunity.* 2013. [PDF](http://cowles.yale.edu/sites/default/files/files/pub/d19/d1921.pdf)
- Hardt, M. and Price, E. *Equality of Opportunity in Supervised Learning.* NeurIPS 2016. [Online](http://papers.nips.cc/paper/6373-equality-of-opportunity-in-supervised-learning)
- Celis, E., Huang, L., et al. *Classification with fairness constraints: A meta-algorithm with provable guarantees.* FAT\* 2019. [Online](https://dl.acm.org/citation.cfm?doid=3287560.3287586)
- Dwork, C., Hardt, M., et al. *Fairness Through Awareness.* ITCS 2012. [Online](https://dl.acm.org/citation.cfm?id=2090255)
- Zafar, M., Valera, I., et al. *Fairness Constraints: Mechanisms for Fair Classification.* PMLR 2017. [Online](http://proceedings.mlr.press/v54/zafar17a.html)
- Chouldechova, A. *Fair Prediction with Disparate Impact: A Study of Bias in Recidivism Prediction Instruments.* Big Data, 2017. [Online](https://www.liebertpub.com/doi/10.1089/big.2016.0047)

**Wednesday: Check-ins**

**Thursday: Project work**

---

## Week 13 — Field trials: validating ML models
*Nov 24*

> 📌 **Due Monday, Nov 23: weekly project update** — bias and disparity results.
>
> **No class Wednesday or Thursday — Thanksgiving.**

This week your group should be continuing to investigate any disparities in your model results, as well as performing any other necessary post-modeling analyses.

**Tuesday: [Field trials: validating ML models](Lectures/FieldValidation.pptx)**

A model that performs well on historical data has not yet been shown to help an organization achieve its goals. We'll cover how to design a field trial that tests both predictive accuracy in deployment and the effect of acting on those predictions, and what makes such trials hard in policy settings.

---

## Week 14 — Wrap-up and final presentations
*Dec 1, 2, 3*

**Tuesday:** Class wrap-up and time for teams to finish project work.

**Wednesday:** Final check-ins and presentation prep.

**Thursday: Final presentations.** Each group presents their applied ML project as described on the [project page](project.md#5-final-presentation).

---

## Finals week — final report due
*Dec 9*

Incorporating the results of your project work throughout the semester as well as feedback from your final presentation, each group writes a [final project report](project.md#6-final-report).

---

## General background reading

These are useful background but are not required texts:

- Provost, F. and Fawcett, T. *Data Science for Business.*
- Foster, Ghani, et al. (eds). *Big Data and Social Science.* [Online](https://textbook.coleridgeinitiative.org/)
- Nielsen, A. *Practical Fairness: Achieving Fair and Secure Data Models.*
- Barocas, S., Hardt, M., and Narayanan, A. *Fairness and Machine Learning.* [Online](https://fairmlbook.org/)
- Tukey, J. *Exploratory Data Analysis.*
