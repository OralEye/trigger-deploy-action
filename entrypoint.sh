#!/usr/bin/env sh
AUTH_HEADER="Authorization: token ${INPUT_GITHUB_TOKEN}"

curl \
  -X POST \
  -H "${AUTH_HEADER}" \
  -H "Accept: application/vnd.github.v3+json" \
  https://api.github.com/repos/OralEye/jaws2/deployments \
  -d "{
        \"ref\":\"${INPUT_GIT_REF}\",
        \"auto_merge\": false,
        \"environment\": \"${INPUT_ENVIRONMENT}\",
        \"required_contexts\":[],
          \"payload\":
           {
             \"testrail_run_id\": \"${INPUT_TESTRAIL_RUN_ID}\",
             \"api_request_sleep\": \"0\",
             \"log_level\": \"INFO\"
           }
      }"
