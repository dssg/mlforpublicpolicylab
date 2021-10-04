# 94889: Machine Learning for Public Policy Lab

**Previous Versions:**
- **[Spring 2020](https://github.com/dssg/mlforpublicpolicylab/tree/Spring2020)**
- **[Fall 2020](https://github.com/dssg/mlforpublicpolicylab/releases/tag/Fall2020)**
 
### Fall 2021: Tues & Thurs, 3:05-4:25pm (HBH 2008), Lab Section: Wednesday 6:20-8pm (HBH 1202)

### Important 
 - **All content will be on github in this repo including [schedule](README.md#schedule) and [tech setup instructions](techhelp/)**
 - **All assignments will be on and submitted through [canvas](https://canvas.cmu.edu/courses/25318)**
 - **Class communication and announcements will be primarily through Slack**

This is a project-based course designed to provide training and experience in solving real-world problems using machine learning, with a focus on problems from public policy and social good.

Through lectures, discussions, readings, and project assignments, students will learn about and experience building end-to-end machine learning systems, starting from project definition and scoping,  to modeling, to field validation and turning their analysis into action. Through the course, students will develop skills in problem formulation, working with messy data, communicating about machine learning with non-technical stakeholders, model interpretability, understanding and mitigating algorithmic bias & disparities, and evaluating the impact of deployed models.

**Pre-Requisites**: Students will be expected to know Python (for data analysis), and have prior graduate coursework in machine learning. This course assumes that you have taken graduate Machine Learning courses before and is focused on teaching how to use ML to solve real-world problems. Experience with SQL, *nix command line, git(hub), and working on remote machines will be helpful and is highly recommended.

**[DRAFT SYLLABUS](/syllabus.pdf)**

## People

### Instructors

| Rayid Ghani | Kit Rodolfa |
| --- | --- |
| <img src='http://www.datasciencepublicpolicy.org/wp-content/uploads/2018/05/RayidGhani-012-400x400.jpg' width='200' height='200' /> <br /> GHC 8023 <br /> Office Hours: <br />  Tue 12-1, Wed 2-3 | <img src='/kit_rodolfa.png' /> <br /> GHC 8018 <br /> Office Hours: <br /> Wed 11-12, Thu 12-1 |

### Teaching Assistants
Teaching Assistants are responsible for managing the compute infrastructure and help with logging in, scaling the infrastructure, and connection issues.

| Riyaz Panjwani | Abhishek Parikh |
| --- | --- | 
| <img src='/riyaz_panjwani.jpeg' /> <br /> Office Hours: <br /> Mon 12-1, Fri 10-11 <br /> by GHC 8th Fl. Printer | <img src='abhishek-parikh_400x400.jpeg' width='200' height='200' /> <br /> Office Hours: <br /> Mon 11-12, Fri 2-3 <br /> by GHC 8th Fl. Printer |

## Grading 

Data loading exercise (5%)

Written scope and proposal for their project work (10%)

Peer reviews of three peer project proposals (2.5%)

Midterm project update presentation (7.5%)

Brief project progress update assignments (20%)

Final group presentation of results targeted towards policy stakeholders (10%)

Written final project report and code (20%)

Quizzes on readings and assigned videos (5%)

Class attendance and participation (15%)

Submitting weekly check-in and feedback forms (5%)

## Schedule

See the **[syllabus](/syllabus.pdf)** for much more detail as well, including information about group projects, grading, and helpful optional readings.

| Week | Dates            | Topic                                                                                                                                        | Required Readings                                                                                                                                                                 | Assignments                                                                                                                           |
| ---- | ---------------- | -------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------- |
| 1    | Tu: Aug 31       | [Class Intro and Overview](https://github.com/dssg/MLinPractice/raw/main/Lectures/Lecture1-ClassOverview.pptx)                               |                                                                                                                                                                                   |                                                                                                                                       |
| 1    | Th: Sep 2        | [ML Project Scoping](https://github.com/dssg/MLinPractice/raw/main/Lectures/Lecture2-Scoping.pptx)                                           | [ML Project Scoping Guide](http://www.datasciencepublicpolicy.org/home/resources/data-science-project-scoping-guide/)                                                             | Project Team Selection                                                                                                                |
| 2    | Tu: Sep 7        | [Getting, Storing, and Linking Data](https://github.com/dssg/MLinPractice/raw/main/Lectures/Lecture3-Data.pptx)                              | [Optional readings on github](https://github.com/dssg/MLinPractice/blob/main/Readings/README.md#lecture-3---acquiring-storing-and-linkg-data-and-downstream-ethical-implications) |                                                                                                                                       |
| 2    | Th: Sep 9        | [Analytical Formulation / Baselines](https://github.com/dssg/MLinPractice/raw/main/Lectures/Lecture4-Formulation.pptx)                       | [List on github](https://github.com/dssg/MLinPractice/blob/main/Readings/README.md#lecture-4---analytical-formulation-and-baselines)                                              |                                                                                                                                       |
| 3    | Tu: Sep 14       | [Model Selection Methodology](https://github.com/dssg/MLinPractice/raw/main/Lectures/Lecture5-ModelSelection.pptx)                           | [Readings on github](https://github.com/dssg/MLinPractice/tree/main/Readings#lecture-5---model-selection-methodologies)                                                           | Project Assignment 1: Formulation and Baseline (due Monday)                                                                           |
| 3    | Th: Sep 16       | [Performance Metrics](https://github.com/dssg/MLinPractice/raw/main/Lectures/Lecture6-EvaluationMetrics.pptx)                                | [Readings on github](https://github.com/dssg/MLinPractice/tree/main/Readings#lecture-6---evaluationperformance-metrics)                                                           |                                                                                                                                       |
| 4    | Tu: Sep 21       | [Feature Engineering and Imputation](https://github.com/dssg/MLinPractice/raw/main/Lectures/Lecture7-Features.pptx)                          | [Readings on github](https://github.com/dssg/MLinPractice/tree/main/Readings#lecture-7---feature-engineering-and-imputation)                                                      | Project Assignment 2:<br>Validation set up<br>Initial pipeline with train and validation set(s) and baseline implemented (due Monday) |
| 4    | Th: Sep 23       | [Hands-on Session for ML Pipeline review](https://github.com/dssg/MLinPractice/raw/main/Lectures/Lecture8-Machine-Learning-Pipelines.pptx)   |                                                                                                                                                                                   |                                                                                                                                       |
| 5    | Tu: Sep 28       | [Models/hyperparameters in practice](https://github.com/dssg/MLinPractice/raw/main/Lectures/Lecture9-PracticalModeling-Hyperparameters.pptx) |                                                                                                                                                                                   | Project Assignment 3:<br>list of features and some subset implemented (due Monday)                                                    |
| 5    | Th: Sep 30       | [Temporal Model Selection](https://github.com/dssg/MLinPractice/raw/main/Lectures/Lecture10-ModelSelection2.pptx)                            | [Readings on github](https://github.com/dssg/MLinPractice/tree/main/Readings#lecture-10---model-validation-continued)                                                             |                                                                                                                                       |
| 6    | Tu: Oct 5        | [Module 1 Review: Applied ML - End to End Pipelines](https://github.com/dssg/MLinPractice/raw/main/Lectures/Lecture11-Module1Review.pptx)    |                                                                                                                                                                                   | Project Assignment 4:<br>modeling results (due Monday)                                                                                |
| 6    | Th: Oct 7        | Mid-term - no class                                                                                                                          |                                                                                                                                                                                   |                                                                                                                                       |
| 7    | Tu: Oct 12       | ML Ethics Issues Overview                                                                                                                    | [Readings on github](https://github.com/dssg/MLinPractice/tree/main/Readings#lecture-18---ml-ethics-and-fairness-overview)                                                        |                                                                                                                                       |
| 7    | Th: Oct 14       | No Class - Mid-semester break                                                                                                                |                                                                                                                                                                                   |                                                                                                                                       |
| 8    | Tu: Oct 19       | Interpretability: Intro and Overview, taxonomy                                                                                               | Readings on github                                                                                                                                                                | Updated model results assignment (+ model selection) Due Monday                                                                       |
| 8    | Th: Oct 21       | Understanding the Models                                                                                                                     | Readings on github                                                                                                                                                                |                                                                                                                                       |
| 9    | Tu: Oct 26       | Interpretability Methods: Inherently Interpretable (GA2Ms, RiskSLIM, etc.)                                                                   | Readings on github                                                                                                                                                                |                                                                                                                                       |
| 9    | Th: Oct 28       | Interpretability Methods:: Post-Hoc Local/Feature-based (LIME, SHAP, MAPLE)                                                                  | Readings on github                                                                                                                                                                |                                                                                                                                       |
| 10   | Tu: Nov 2        | Interpretability Methods: Other methods (counterfactual, example-based, etc.)                                                                | Readings on github                                                                                                                                                                |                                                                                                                                       |
| 10   | Th: Nov 4        | Module 2 Review: ML Interpretability                                                                                                         | Readings on github                                                                                                                                                                | Interpretability Writeup Due on Friday                                                                                                |
| 11   | Tu: Nov 9        | Fairness in ML Overview                                                                                                                      | Readings on github                                                                                                                                                                |                                                                                                                                       |
| 11   | Th: Nov 11       | Fairness Methods: Pre-processing (removing sensitive attribute, sampling)                                                                    | Readings on github                                                                                                                                                                |                                                                                                                                       |
| 12   | Tu: Nov 16       | Fairness Methods: In-processing (Zafar, Celis, fairlearn, etc.)                                                                              | Readings on github                                                                                                                                                                |                                                                                                                                       |
| 12   | Th:Nov 18        | Post-Processing: Hardt, LA, etc                                                                                                              | Readings on github                                                                                                                                                                |                                                                                                                                       |
| 13   | Tu: Nov 23       | Module 3 Review: ML Fairness                                                                                                                 | Readings on github                                                                                                                                                                |                                                                                                                                       |
| 13   | Th: Thanksgiving | Thanksgiving holiday                                                                                                                         |                                                                                                                                                                                   |                                                                                                                                       |
| 14   | Tu: Nov 30       | Field Trials and Causality                                                                                                                   | Readings on github                                                                                                                                                                | Bias Writeup Due                                                                                                                      |
| 14   | Th: Dec 2        | Wrap-Up                                                                                                                                      |                                                                                                                                                                                   |                                                                                                                                       |
| 15   | Tu: Dec 7        | No Class - Finals Week                                                                                                                       |                                                                                                                                                                                   |                                                                                                                                       |
| 15   | Th: Dec 9        | No Class - Finals Week                                                                                                                       |                                                                                                                                                                                   | Final Research Writeup Due                                                                                                            |





| Week | Dates                          | Tuesday                                                                  | Wednesday                                                                                                                                            | Thursday                                                                             | Assignments                                                            | Project Focus                                                                  |
| ---- | ------------------------------ | ------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------ | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------ |
| 1    | Tu: Aug 31<br>Th: Sep 2        | Intro/Overview + Project Overviews                                       | Basic Tech Setup: Make sure students can connect to the server through ssh, have access to github, and access the db both from psql and from dbeaver | Th: Scoping, Problem Definition, Balancing goals (equity, efficiency, effectiveness) | 1\. Survey (Monday)<br>2\. Project preferences + signature (Wednesday) | Get familiar with the class, goals, and understand project choices             |
| 2    | Tu: Sep 7<br>Th: Sep 9         | Case Studies + Discussion                                                | Git + SQL                                                                                                                                            | Acquiring Data, Privacy, Record Linkage                                              | ACS Data (Tuesday)                                                      | Data Audit and Exploration                                                     |
| 3    | Tu: Sep 14<br>Th: Sep 16       | Data Exploration<br><br>\+ 30 min project team meeting/coordination      | Remote Tech Workflows                                                                                                                                | Analytical Formulation / Baselines                                                   |                                                                        | Data Stories and Finalize Project Scope                                        |
| 4    | Tu: Sep 21<br>Th: Sep 23       | Building ML Pipelines                                                    | Triage Configuration Tech Session                                                                                                                    | Project Work                                                                         | Project Proposal (Friday)                                              | Initial ML Pipeline Setup<br>Analytical Formulation and Baselines              |
| 5    | Tu: Sep 28<br>Th: Sep 30       | Performance Metrics / Evaluation Ptart 1: Model Selection and Validation | Python + SQL                                                                                                                                         | Project Work                                                                         | Proposal Reviews (Friday)                                              | Iteration 1 - Build End to End Code Pipeline<br>(Focus on end-to-end shell)    |
| 6    | Tu: Oct 5<br>Th: Oct 7         | Performance Metrics / Evaluation Part 2: Model Selection and Validation  | Group Check-Ins                                                                                                                                      | Temporal Deep Dive with projects                                                     | Analytic Formulation, Baselines, and Skeleton Pipeline Code (Friday)   |                                                                                |
| 7    | Tu: Oct 12<br>Th: Oct 14       | Feature Engineering / Imputation                                         | Group Check-Ins                                                                                                                                      | NO CLASSES                                                                           |                                                                        | Iteration 2 - End to End Code Pipeline<br>(Focus on feature development)       |
| 8    | Tu: Oct 19<br>Th: Oct 21       | ML Modeling in Practice                                                  | Group Check-Ins                                                                                                                                      | Project Work                                                                         | Modeling Plan and Feature List (Monday)                                |                                                                                |
| 9    | Tu: Oct 26<br>Th: Oct 28       | Mid term Project Progress Presentation Reviews                           | Group Check-Ins                                                                                                                                      | Project Work                                                                         | V0 Results, Train Test Splits, Model Selection Metric(s) (Monday)      | Iteration 3 - End to End Code Pipeline<br>(Focus on models and evaluation)     |
| 10   | Tu: Nov 2<br>Th: Nov 4         | Performance Metrics / Evaluation Pt. II (audition)                       | Group Check-Ins                                                                                                                                      | Eberly Session<br><br>Project Work                                                   | Pipeline updates (Monday)                                              |                                                                                |
| 11   | Tu: Nov 9<br>Th: Nov 11        | Model Interpretability Pt. I: global + postmodeling                      | Group Check-Ins                                                                                                                                      | Project Work                                                                         | Weekly Update Assignment (Monday) - More complete results over time    | Iteration 4 - End to End Code Pipeline<br>(Focus on interpreting the models)   |
| 12   | Tu: Nov 16<br>Th:Nov 18        | Bias and Fairness Pt I                                                   | Group Check-Ins                                                                                                                                      | Project Work                                                                         | Weekly Update Assignment (Monday) - Feature Importances + Crosstabs    |                                                                                |
| 13   | Tu: Nov 23<br>Th: Thanksgiving | Bias and Fairness Pt II and Field Trials                                 | HOLIDAY                                                                                                                                              | HOLIDAY                                                                              | Weekly Update Assignment (Monday) - Bias                               | Final model choice and understanding its performance and impact on disparities |
| 14   | Tu: Nov 30<br>Th: Dec 2        | Final Presentations                                                      |                                                                                                                                                      | Final Presentations and Wrap-up                                                      | Presentations                                                          | Project Report and Presentations                                               |
| 15   | Tu: Dec 7<br>Th: Dec 9         | Finals Week                                                              |                                                                                                                                                      |                                                                                      | Final Report Due                                                       | Final Report, Code, Repo, Documentation                                        |
