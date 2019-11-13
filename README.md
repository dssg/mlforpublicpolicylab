# Machine Learning for Public Policy Lab
### Spring 2020: 10718, 94889
### Tues & Thurs, 3:00-4:20pm, GHC 4307

This is a project-based course designed to provide students training and experience in solving real-world problems using machine learning, with a focus on problems from public policy and social good.

Through lectures, discussions, readings, and project assignments, students will learn about and experience building end-to-end machine learning systems, starting from project definition and scoping, through modeling, to field validation and turning their analysis into action. Through the course, students will develop skills in problem formulation, working with messy data, communicating about machine learning with non-technical stakeholders, model interpretability, understanding and mitigating algorithmic bias & disparities, and evaluating the impact of deployed models.

Students will be expected to know python, and have prior coursework in machine learning.

**[DRAFT SYLLABUS](/syllabus.pdf)**

## People

### Instructors

| Rayid Ghani | Kit Rodolfa |
| --- | --- |
| <img src='http://www.datasciencepublicpolicy.org/wp-content/uploads/2018/05/RayidGhani-012-400x400.jpg' width='200' height='200' /> <br /> GHC 8023 | <img src='/kit_rodolfa.png' /> <br /> GHC 8112 |


|   | **ML for Public Policy Lab** |  |  |  |  |  |  |
| :---: | :---: | --- | --- | --- | --- | --- | --- |
|  **Week** | **Dates** | **Holidays?** | **Lecture/Discussion Topic** | **Project Activity** | **Goal** | **Readings** | **Delvierable / Expected Output** |
|  1 | Tu: Jan 14<br/>Th: Jan 16 |  | Tu: Intro/Overview + Project Overviews<br/>Th: Scoping, Problem Definition, Balancing goals (equity, efficiency, effectiveness) | Intro/Overview | Get familiar with the class, goals, and understand project choices | (none for Tues)<br/><br/>• DSaPP Scoping Guide<br/>• Bias Metrics?<br/>• One case study for Thursday, walk through scope example in lecture<br/>• Hand, Deconstructing Stat. Quest.? |  |
|  2 | Tu: Jan 21<br/>Th: Jan 23 |  | Tu: Case Studies + Discussion<br/>Th: Acquiring Data, Privacy, Record Linkage | Project Definition & Data Discovery | Data Audit and Exploration<br/><br/>TA Sessions: SQL, Databases, github | • "What could go wrong" case study:<br/>  - Predictive Policing (Lum and Isaac, To predict and serve)?<br/>  - Lecher, What Happens When an Algorithm Cuts Your Health Care (The Verge)<br/>  - Others?<br/>• "What could go right" case study:<br/>  - Lead paper?<br/>  - Syracuse water mains?<br/>  - Police EIS?<br/>  - Others?<br/><br/>• Ohm, Broken Promises of Privacy (Intro and Sec. 1)<br/>• Data Matching Book, Ch. 2<br/>• Database chapter from Big Data/Social Science book? | Beginning of week, team and project assignments |
|  3 | Tu: Jan 28<br/>Th: Jan 30 |  | Tu: Data Exploration<br/>Th: Building ML Pipelines |  | Finalize Project Scope and Data Stories | • Brillinger, Data Analysis, Exploratory (https://www.stat.berkeley.edu/~brill/Papers/EDASage.pdf)<br/>• Practical Statistics for Data Scientists, Ch. 1?? (looks like good overview, but code snippets use R)??<br/><br/>• Pipeline reading (Rayid)? | ETL of some dataset (census?)<br/>Data exploration<br/>Scope refinement |
|  4 | Tu: Feb 4<br/>Th: Feb 6 |  | Analytical Formulation / Baselines |  | Initial Data Science Pipeline Setup and Mockups<br/>(problem formulation and validation process) | • Science bias paper (Obermeyer et al) -- analytical formulation example<br/>• Ameisen, Always Start with a Stupid Model (Medium)<br/>• Ramakrishnan, Create a Common-Sense Baseline First (Medium)<br/>• Provost and Fawcett, Data Sci for Business, Ch. 2 | *First week of deep dives<br/>Project Scope + Proposal with Descriptive Statistics* |
|  5 | Tu: Feb 11<br/>Th: Feb 13 |  | Feature Engineering / Imputation | Code Pipeline Development | Iteration 1 - Build End to End Code Pipeline <br/>(Focus on end-to-end shell) | • Gelman imputation chapter?? (code all in R but good concept overview)<br/>• Akinfaderin, Missing Data Conundrum (Medium)?<br/>• Zhang and Casari, Feature Engineering for ML, Chapter 2<br/>• Rayid case study example with feature details? | Skeleton Code (Pipeline), Mockups<br/>Proposal Peer Reviews |
|  6 | Tu: Feb 18<br/>Th: Feb 20 |  | Performance Metrics / Evaluation Pt. I (splits, metrics) |  |  | • Rudin, Secrets of ML?<br/>• Intertemporal CV paper?<br/>• ML Chapter from Big Data Social Sci Book? | Technical Modeling Plan (features, label definition(s), model specifications, etc) |
|  7 | Tu: Feb 25<br/>Th: Feb 27 | (Feb 24 drop deadline) | Performance Metrics / Evaluation Pt. II (audition) |  | Iteration 2 - End to End Code Pipeline<br/>(Focus on feature development) | • Stapor, Evaluating and Comparing Classifiers<br/>• Transductive TopK (Liu et al) or similar? | Code (Pipeline), Initial Models (and analysis) |
|  8 | Tu: Mar 3<br/>Th: Mar 5 |  | Overfitting, Leakage, Issues in Deployment |  |  | • Riley, Three Pitfalls to Avoid in Machine Learning (Nature)<br/>• Provost and Fawcett, Data Sci for Business, Ch. 5<br/>• Kaufman et al, Leakage in Data Mining<br/>• Gonfalonieri, Why is Machine Learning Deployment Hard? (Medium)<br/>- OR - Kervizic, Overview of Different Approaches to Deploying Machine Learning Models in Production (KD Nuggets) | Early Results: Correct but Crappy |
|  9 | Tu: Mar 17<br/>Th: Mar 19 | (prev wk spring brk) | Model Interpretability Pt. I: global + postmodeling |  | Iteration 3 - End to End Code Pipeline <br/>(Focus on evaluation, results and intial front-end demo) | **TBD** | **Refined Feature List** |
|  10 | Tu: Mar 24<br/>Th: Mar 26 |  | Model Interpretability Pt. II: local |  |  | • LIME<br/>• MAPLE<br/>• Rudin? | Model Interpretation |
|  11 | Tu: Mar 31<br/>Th: Apr 2 |  | Bias and Fairness Pt I |  |  | • Rawls Theory of Justice?<br/>• Huq or COMPAS? | Results (across models, features, metrics)<br/>Add bias analysis methods |
|  12 | Tu: Apr 7<br/>Th: Apr 9 |  | Bias and Fairness Pt II | Model selection, evaluation, balancing efficiency and equity | Final model choice and understanding its performance and impact on disparities | • Chouldecova (case study)<br/>• Hardt or Dwork (post-model adjustment methods)?<br/>• Fairness-constrained method (Celis et al or Zafar et al)? | **Draft Research Proposal Section** |
|  13 | Tu: Apr 14<br/>Th: Apr 16 | Apr 16 | Causality and Field Validation |  |  | • Causal Inference Overview (maybe: Peters et al, Elements of Causal Inference, Ch. 1 and 2?)<br/>- OR - Pearl, Seven Tools of Causal Inference with Reflections on ML<br/>• Case study with field trial (e.g. Lead?) | *No deep dive - Thursday off* |
|  14 | Tu: Apr 21<br/>Th: Apr 23 |  | Analysis to Action, Accountability and Transparency | Communications & Transition Planning | Project Report and Presentations<br/>Field Trial Design | • DJ ethics book<br/>• Communicating about data, maybe:<br/>  - Communicating Data with Tableau, Ch. 1 (not tableau-specific)<br/>  - Making Data Talk (Nat'l Cancer Institute)<br/>  - Wainer, Improving Data Displays (http://www.stat.columbia.edu/~gelman/communication/Wainer2009.pdf)<br/>  - Gelman and Nolan, Lying with Statistics (Ch 11 from Teaching Statistics: A Bag of Tricks) | **Last week of deep dives<br/>Draft Field Trial Design Section** |
|  15 | Tu: Apr 28<br/>Th: Apr 30 |  | Final Presentations | Presentations |  |  | **Presentation** |
|  16 | TBD | (Finals Wk) |  | Final Report Due | Final Report |  | **Report and Repo and Code Documentation** |
