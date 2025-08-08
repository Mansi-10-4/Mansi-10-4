#!/bin/bash

# Fetch latest 5 updated repos, format with stars and description
repos=$(curl -s https://api.github.com/users/mansi-10-4/repos?sort=updated&per_page=5 | jq -r '.[] | "- [" + .name + "](" + .html_url + ") ⭐ " + (.stargazers_count|tostring) + " - " + (.description // "No description") + " (Created: " + .created_at[0:10] + ")"')

# Export the result as an environment variable for GitHub Actions
echo "LATEST_PROJECTS<<EOF" >> $GITHUB_ENV
echo "$repos" >> $GITHUB_ENV
echo "EOF" >> $GITHUB_ENV
