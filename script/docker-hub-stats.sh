#!/usr/bin/env bash

todays_date=$(date +'%Y-%m-%d')
echo "Getting image stats from docker hub for date: $todays_date"
image_with_pull_count=$(curl -s https://hub.docker.com/v2/repositories/datacatering | jq -r --arg date "$todays_date" '.results[] | $date + "," + .name + "," + (.pull_count|tostring)')

echo "$image_with_pull_count" >> docker-hub-stats.csv
echo "Complete!"
