# Class project

[← Back to course home](README.md) · [Schedule](schedule.md) · [Syllabus](syllabus.md) · [Policies](policies.md)

Beginning in the second week of class, groups of about four students work together on a machine learning project throughout the semester, using one of several real-world public policy problems. Each week, every group submits a project assignment. In addition to connecting the readings and discussion topics to the policy domain, these updates give you a chance to get input and feedback and iterate.

> ⚠️ **Data security.** Project data is sensitive and must remain in the secure computing environment provided for the course. See the [data security policy](policies.md#data-security) — violations result in automatic failure of the class.

## Deliverables at a glance

| # | Deliverable | Due | Weight |
| --- | --- | --- | --- |
| 1 | [Project proposal](#1-project-proposal) | Tue, Sep 15 | 10% |
| 2 | [Peer reviews of three proposals](#2-proposal-peer-reviews) | Tue, Sep 22 | 5% |
| 3 | [Weekly progress updates](#3-weekly-progress-updates) | Most Tuesdays | 25% |
| 4 | [Final presentation](#5-final-presentation) | Thu, Dec 3 | 10% |
| 5 | [Final report and code](#6-final-report) | Wed, Dec 9 | 25% |

20% of your grade is class attendance and participation and 5% is weekly feedback forms — see [policies](policies.md#grading).

---

## 1. Project proposal

Submitted as a group, 4–5 pages not including figures, tables, or references. It should cover the project scope and preliminary descriptive statistics about the entities in your dataset, and include the provided [scoping worksheet](project/) as an appendix.

Useful reference: the [Data Science Project Scoping Guide](https://datasciencepublicpolicy.org/our-work/tools-guides/data-science-project-scoping-guide/).

## 2. Proposal peer reviews

Each student reviews three other groups' proposals. Reviews should be constructive and specific: is the problem well scoped, is the proposed formulation the right one, what would you imorove?

## 3. Weekly Project Assignments 

Short update assignments, generally due Tuesdat, that guide the check-in discussions. These typically take the form of filling results or modeling details into a handful of template slides. Over the semester these build up the technical core of the project:

- **Analytical formulation, baselines, and cohort/label queries** (week 6)
- **Modeling plan and temporal validation configuration** (week 8) — how the scope in your proposal is formulated as an ML problem, and the elements of the pipeline your group will build
- **V0 baseline results and planned feature list** (week 9) — the specific features to be built, the underlying data, the level at which information is available, aggregation strategies over time or geography, and your plan for handling missing values
- **V0 modeling results** (week 10)
- **Interpretability results** (week 11)
- **Feature importances and crosstabs** (week 12)
- **Bias and disparity results** (week 13)

Updates are graded for completeness and correctness. We expect this work to be iterative: errors identified in one week's update that are corrected by the next week results in revision of the previous score up to 80% of the total possible.

## 4. Final presentation

15 minutes plus 3 minutes for questions. The final presentation should be geared toward the relevant decision makers for your project: an overview of the problem and approach, your results, policy recommendations, and limitations of the work.

## 6. Final report

Approximately 10 pages, accompanying the final presentation. It should include:

- An executive summary, no more than one page, succinctly describing the project, results, and recommendations.
- An overview of the problem, its significance, and the scope and goals of the work.
- A description of the methodology and results, with a link to well-documented code in your group's course GitHub repository.
- A brief (1–2 paragraph) design of a field trial to evaluate the accuracy of the resulting model in practice, as well as its ability to help the organization achieve its goals.
- Concluding lessons and recommendations for the partner organization.
- Optionally, a proposal for future work beyond the scope of this project — novel ML methods that could improve on the current work, new policy interventions to evaluate, or related research opportunities.

---

## Project iteration targets

The point of the weekly cadence is to have a working end-to-end system early and improve it, rather than building the pieces separately and integrating at the end.

| Iteration | Weeks | Focus |
| --- | --- | --- |
| 1 | 5–6 | End-to-end shell — the simplest possible full pipeline |
| 2 | 7–8 | Feature development |
| 3 | 9–10 | Models and evaluation |
| 4 | 11–12 | Interpreting the models |
| Final | 13–14 | Final model choice, disparities, impact |

## Templates and worksheets

Scoping worksheets, update slide templates, and report templates are in the [`project/`](project/) directory.
