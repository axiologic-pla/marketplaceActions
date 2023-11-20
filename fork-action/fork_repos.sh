#!/bin/bash

response=$(curl -s -H "Authorization: token $GITHUB_TOKEN" -w "%{http_code}" -o response.json "https://api.github.com/orgs/$SOURCE_ORG/repos?type=all&per_page=100")
status_code=$(tail -n1 <<< "$response")

# Handles non-existence organization
if [ "$status_code" == "404" ]; then
    echo "Error: Unable to find the source/target organization. HTTP Status $status_code."
    exit 1
fi

# Handles authentication issues
if [ "$status_code" == "401" ] || [ "$status_code" == "403" ]; then
    echo "Error: There is an issue with GIT access TOKEN. HTTP Status $status_code."
    exit 1
fi

if [ "$status_code" != "200" ]; then
    echo "Error: Unable to fetch repositories. HTTP Status $status_code."
    exit 1
fi


# List all repositories in the source organization
repos=$(curl -s -H "Authorization: token $GITHUB_TOKEN" \
    "https://api.github.com/orgs/$SOURCE_ORG/repos?type=all&per_page=100" | jq -r '.[].full_name')

# Handles if there are no repositories in the source organization
if [ -z "$repos" ]; then
    echo "No repositories found in the source organization: $SOURCE_ORG"
    exit 1
fi

# Loop through each repository and fork it to the target organization
for repo in $repos; do
    echo "Attempting to fork $repo to $TARGET_ORG..."

    # API call to fork the repository
    response=$(curl -s -X POST -H "Authorization: token $GITHUB_TOKEN" \
        -H "Accept: application/vnd.github.v3+json" \
        "https://api.github.com/repos/$repo/forks" \
        -d "{\"organization\":\"$TARGET_ORG\"}")

    # Check if the fork already exists
    if echo "$response" | jq -e '.full_name' | grep -q "$TARGET_ORG"; then
        echo "Repository $repo is already forked."
    else
        echo "Forked $repo successfully."
    fi
done
