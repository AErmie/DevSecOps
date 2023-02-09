#!/bin/bash

if [[ -z "$2" ]]; then
    echo "You need to use this script with following parameters. (Either 'cp' or 'rm') and ('aws', 'azure', etc.)"
    exit 1
fi

provider="$2"
if [[ "$2" == "all" ]]; then
  ./tests/cp_features.sh "$1" aws
  ./tests/cp_features.sh "$1" azure
  exit 0
fi

features=$(ls -1 $provider/*.feature | sed s/\.feature//g)
git_root_dir=$(pwd)
test_root_dir="$git_root_dir/tests"

for feature in $features;
do
	test_module="$test_root_dir/$feature"

	if [ ! -d "$test_module" ]; then
            echo "Could not find any test written for $test_module feature."
            continue
  fi

	# Get into the feature test directory
    cd "$test_module"

    if [[ "$1" == "cp" ]]; then
      # Copy the feature file temporarily
      cp "$git_root_dir/$feature.feature" .
    elif [[ "$1" == "rm" ]]; then
      # Remove the temporary feature file
      rm *.feature
    fi

done