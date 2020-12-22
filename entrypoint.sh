#!/usr/bin/env sh
AUTH_HEADER="Authorization: token ${INPUT_GITHUB_TOKEN}"

curl \
  -X POST \
  -H "${AUTH_HEADER}" \
  -H "Accept: application/vnd.github.v3+json" \
  https://api.github.com/repos/${INPUT_REPO_NAME}/deployments \
  -d @- <<EOF
{
  "ref":"${INPUT_GIT_REF}",
  "auto_merge": false,
  "environment": "${INPUT_ENVIRONMENT}",
  "required_contexts":[]
}
EOF
