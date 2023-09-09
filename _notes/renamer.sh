#!/bin/bash

input_file="Comptia220-1101.md"  # Ersetzen Sie dies durch den Namen Ihrer Markdown-Datei
current_dir=""
parent_dir=""
grandparent_dir=""
great_grandparent_dir=""

while IFS= read -r line; do
    if [[ $line == "# "* ]]; then
        dir_name=$(echo $line | sed 's/# //; s/ /_/g')
        mkdir -p "$dir_name"
        great_grandparent_dir=$dir_name
    elif [[ $line == "## "* ]]; then
        dir_name=$(echo $line | sed 's/## //; s/ /_/g')
        mkdir -p "$great_grandparent_dir/$dir_name"
        grandparent_dir=$dir_name
    elif [[ $line == "### "* ]]; then
        dir_name=$(echo $line | sed 's/### //; s/ /_/g')
        mkdir -p "$great_grandparent_dir/$grandparent_dir/$dir_name"
        parent_dir=$dir_name
    elif [[ $line == "#### "* ]]; then
        dir_name=$(echo $line | sed 's/#### //; s/ /_/g')
        mkdir -p "$great_grandparent_dir/$grandparent_dir/$parent_dir/$dir_name"
        current_dir=$dir_name
    elif [[ $line == "- [["* ]]; then
        file_name=$(echo $line | sed 's/- \[\[//; s/\]\]//; s/ /_/g')
        touch "$great_grandparent_dir/$grandparent_dir/$parent_dir/$current_dir/$file_name.md"
    fi
done < "$input_file"
