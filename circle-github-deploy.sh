#!/bin/bash

set -e

## Committing changes to `website/` (source) dir saves intermediate .md files, so servr doesn't re-knit .Rmds if these already exist.
## Committing changes to `docs/` (output dir) alone updates website but will not save intermediate .md files, re-knit .Rmds each time

## CIRCLE env vars are automatically set, but user must add their GH_TOKEN to Circle CI

if [ -e ".git/shallow" ]
then
  git config user.name 'Circle CI' && \
  git config user.email 'bot@circleci.com'
  git fetch --unshallow 
  git add docs/ website/ && \
  git commit -m 'site built on circle ci [ci skip]'
  STATUS=`git push https://${CIRCLE_USERNAME}:${GH_TOKEN}@github.com/${CIRCLE_PROJECT_USERNAME}/${CIRCLE_PROJECT_REPONAME} master`
else 
  git add docs/ website/ && \
  git commit -m 'site built locally[ci skip]' &&
  git push
fi

