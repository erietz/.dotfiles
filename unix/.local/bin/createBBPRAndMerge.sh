#!/bin/bash

# Variables
TOKEN="$BITBUCKET_TOKEN"
WORKSPACE="$BITBUCKET_WORKSPACE"
REPO="$BITBUCKET_REPO"
SOURCE_BRANCH="$(git branch --show-current)"
DEST_BRANCH="preprod"

# # Create a pull request
PR_ID=$(curl -s -X POST -H "Authorization: Bearer $TOKEN" \
     -H "Content-Type: application/json" \
     -d '{
           "title": "Automated PR",
           "source": {
               "branch": {"name": "'"$SOURCE_BRANCH"'"}
           },
           "destination": {
               "branch": {"name": "'"$DEST_BRANCH"'"}
           },
           "close_source_branch": false
       }' \
     "https://api.bitbucket.org/2.0/repositories/$WORKSPACE/$REPO/pullrequests" | jq -r '.id')

echo "Created PR with ID: $PR_ID"

echo "Waiting for the pipeline to kick off..."
sleep 60
echo "Done waiting!"

# Wait for the pipeline on the specific branch to succeed
while true; do
	RESPONSE=$(curl -s -X GET -H "Authorization: Bearer $TOKEN" \
		"https://api.bitbucket.org/2.0/repositories/$WORKSPACE/$REPO/pipelines/?sort=-created_on&target.branch=$SOURCE_BRANCH")

	STATUS=$(echo "$RESPONSE" | jq -r '.values[0].state.result.name')
	echo "Pipeline status: $STATUS"

	if [[ "$STATUS" == "SUCCESSFUL" ]]; then
		echo "Pipeline succeeded!"
		break
	elif [[ "$STATUS" == "FAILED" ]]; then
		echo "Pipeline failed!"
		exit 1
	fi

	sleep 20
done



# Merge the pull request
curl -X POST -H "Authorization: Bearer $TOKEN" \
	"https://api.bitbucket.org/2.0/repositories/$WORKSPACE/$REPO/pullrequests/$PR_ID/merge" | jq

echo "Pull request merged!"
