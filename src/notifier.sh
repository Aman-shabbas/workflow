#!/bin/bash

OWNER=$1
REPO=$2
RUNID=$3
userId="115530103846859678807"

# Prepare JSON body
BODY=$(cat <<EOF
{
"text" : "The <https://github.com/${OWNER}/${REPO}/actions/runs/${RUNID}|pipeline> is failing for <users/${userId}>'s commit",
"thread" : {
"name" : "spaces/AAQAPlQnQlQ/threads/4NnjJVtpyD4"
}
}
EOF
)

# Send HTTP POST request
curl -X POST "https://chat.googleapis.com/v1/spaces/AAQAPlQnQlQ/messages?key=AIzaSyDdI0hCZtE6vySjMm-WEfRq3CPzqKqqsHI&token=01UfofmGc2lS0q-h3BoVpSrwKksjiI-ahKnCTcWSfs0" \
  -H "Content-Type: application/json" \
  -d "$BODY"
