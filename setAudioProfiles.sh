#!/bin/bash
while IFS= read -r line
do
  if [[ $line == *"alsa.card_name"* ]]; then
    card_name=$(echo $line | cut -d '"' -f 2)
    echo "1"
    echo $card_name
  fi
  if [[ $line == *"Active Profile"* ]]; then
    profile=$(echo $line | xargs) # xargs trims leading/trailing white spaces
    echo "2"
    echo $profile
    card_index=$(pactl list cards short | awk -v cn="$card_name" '$2 == cn {print $1}')
    echo "3"
    echo $card_index
    if [[ -n "$card_index" ]]; then
      pactl set-card-profile $card_index $profile
      echo "4"
      echo "Updated profile."
    fi
  fi
done < current_profiles.txt
