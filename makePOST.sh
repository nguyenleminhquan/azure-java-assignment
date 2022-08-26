#!/bin/bash

curl --location --request POST 'https://dev.azure.com/mps-hautp2/demo-azure/_apis/pipelines/5/runs?api-version=6.0' \
--header 'Content-Type: application/json' \
--header "Authorization: Basic $1" \
--header "Cookie: $2" \
--data-raw '{
    "previewRun": false,
    "templateParameters": {
        "test-run": "hello"
    }
}'