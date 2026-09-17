#!/usr/bin/env bash
# Consolidate techhelp/ and techsessions/.
#
# Rule being enforced:
#   techsessions/ = what we did in a session, in week order. Frozen after the session.
#   techhelp/     = reference material, maintained all semester, no session-specific content.
#
# Review each block before running. Run from the repo root on a branch:
#   git checkout -b consolidate-tech-dirs && bash scripts/consolidate_tech_dirs.sh

set -euo pipefail
cd "$(git rev-parse --show-toplevel)"

# ---------------------------------------------------------------------------
# 1. Delete techhelp/remote-workflow/ — a stale fork of techsessions/remote-session2.md
#
#    599 lines vs 585, 308 lines of diff. The techsessions copy is newer: it has
#    the agenda section, the tmux section, and "Sharing the server". Nothing in
#    the repo links to the techhelp copy. It also carries 32 duplicate images,
#    27 of them byte-identical (~1.9 MB).
# ---------------------------------------------------------------------------
git rm -r --quiet techhelp/remote-workflow

# ---------------------------------------------------------------------------
# 2. Delete the two exact/near duplicates. syllabus.md links the techsessions copies.
# ---------------------------------------------------------------------------
git rm --quiet techhelp/tech_session_template.sql       # byte-identical to techsessions copy
git rm --quiet techhelp/python_sql_tech_session.ipynb   # 79 cells each, techsessions is newer

# ---------------------------------------------------------------------------
# 3. Move reference material out of techsessions/
#    db_tips.md is reference, not a session artifact, and nothing links to it.
#    Merge it by hand into class_db_pointers.md afterward — see step 7.
# ---------------------------------------------------------------------------
git mv techsessions/db_tips.md techhelp/db_tips.md

# ---------------------------------------------------------------------------
# 4. Pull the triage material together under techhelp/triage_guide/
#    Right now it is spread across four places. The config templates are for
#    this year's two projects and are currently invisible.
# ---------------------------------------------------------------------------
mkdir -p techhelp/triage_guide/config_templates
git mv techhelp/triage_config_templates/bills_triage_config.yaml techhelp/triage_guide/config_templates/
git mv techhelp/triage_config_templates/mcrt_triage_config.yaml  techhelp/triage_guide/config_templates/
rmdir techhelp/triage_config_templates 2>/dev/null || true
git mv techhelp/building_features_in_triage.md techhelp/triage_guide/building_features.md

# ---------------------------------------------------------------------------
# 5. Fix broken links
# ---------------------------------------------------------------------------
# Absolute paths starting with / break on github.com and on Pages
sed -i 's|(/techhelp/img/|(img/|g' techhelp/jupyter_setup.md

# techhelp/README.md points at techsessions via a full github.com URL; make it relative
sed -i 's|https://github.com/dssg/mlforpublicpolicylab/blob/master/techsessions/remote-session2.md|../techsessions/remote-session2.md|' techhelp/README.md

# techsessions/readme.md still says the sessions are on Wednesday
sed -i 's|## Tech Sessions (Wednesday)|## Tech Sessions (Friday lab)|' techsessions/readme.md

# ---------------------------------------------------------------------------
# 6. Consistent index filenames (GitHub renders either, but pick one)
# ---------------------------------------------------------------------------
git mv techsessions/readme.md techsessions/README.md
git rm --quiet techsessions/img/readme.md      # 1-byte placeholder

echo
echo "Done. Now do the by-hand steps in section 7 of this script, then:"
echo "  git add -A && git commit -m 'Consolidate techhelp and techsessions'"
echo

# ---------------------------------------------------------------------------
# 7. BY HAND — things a script shouldn't guess at
#
# a) techhelp/triage_guide/readme.md links to metrics.md, which does not exist.
#    Either write it or drop the link (it's item 5 under "Design choices").
#    While you're there, add links to config_templates/ and building_features.md.
#
# b) Merge techhelp/db_tips.md into techhelp/class_db_pointers.md as a
#    "Troubleshooting slow queries" section, then delete db_tips.md. Both are
#    database pointers; two files means students find one and not the other.
#
# c) techhelp/sklearn.md (162 bytes) and techhelp/tableau.md (465 bytes) are
#    each a couple of links. Fold them into techhelp/README.md as bullets and
#    delete the files.
#
# d) Decide on these unreferenced techhelp files — nothing in the repo links to
#    any of them, so right now they exist only for people browsing the tree:
#      tech_session_3_git_sql.pdf  (2.0 MB)  looks like a past session artifact
#      pipelines_session.pptx      (327 KB)  ditto
#      models_over_time.ipynb      (253 KB)
#      windows_wsl_guide.md                  still useful — link it from README
#    Past session artifacts belong in techsessions/ with a year suffix, or in
#    the release tag for that year, not in the reference directory.
#
# e) techhelp has both visualize_timechops_example.ipynb (264 KB, referenced)
#    and visualize_timechops_example_updated.ipynb (3.9 KB, not referenced).
#    Keep one. If the updated one is current, promote it and delete the other.
#
# f) After all of the above, rewrite techhelp/README.md as a real index: one
#    line per file saying what it's for. It currently reads as a tutorial with
#    links scattered through it, so several files below it are unreachable.
# ---------------------------------------------------------------------------
