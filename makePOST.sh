#!/bin/bash

curl --location --request POST 'https://dev.azure.com/mps-hautp2/demo-azure/_apis/pipelines/5/runs?api-version=6.0' \
--header 'Content-Type: application/json' \
--header 'Authorization: Basic aGF1dHAyQHZuZy5jb20udm46Z2Fhbmg1dWNqbjdsbnVzdDNwNTVqZzNkaXd5MzR6eWZ3dGFvajR5cHB5a2JzNjZvYjdqYQ==' \
--header 'Cookie: VstsSession=%7B%22PersistentSessionId%22%3A%22df5931cb-d189-468b-bc13-90c7bd116287%22%2C%22PendingAuthenticationSessionId%22%3A%2200000000-0000-0000-0000-000000000000%22%2C%22CurrentAuthenticationSessionId%22%3A%2200000000-0000-0000-0000-000000000000%22%2C%22SignInState%22%3A%7B%7D%7D' \
--data-raw '{
    "previewRun": false,
    "templateParameters": {
        "test-run": "hello"
    }
}'