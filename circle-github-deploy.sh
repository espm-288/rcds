#!/bin/bash

set -e

## Commits changes to `docs/` directory only
## CIRCLE env vars are automatically set, but user must add their GH_TOKEN to Circle CI

if [ -e ".git/shallow"]
then
  git config user.name 'Circle CI' && \
  git config user.email 'bot@circleci.com'
  git fetch --unshallow 
  git add docs/ && \
  git commit -m 'site built on circle ci [ci skip]'
  STATUS=`git push https://${CIRCLE_USERNAME}:${GH_TOKEN}@github.com/${CIRCLE_PROJECT_USERNAME}/${CIRCLE_PROJECT_REPONAME} master`
else 
  git add docs/ && \
  git commit -m 'site built locally[ci skip]' &&
  git push
fi

