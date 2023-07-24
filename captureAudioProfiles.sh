#!/bin/bash

# Name of the file where the profiles are saved
filename="audio_profiles.txt"

# Clear the file
> $filename

# Get a list of all cards
card_indices=$(pactl list cards short | awk '{print $1}')

# echo "1"
echo $card_indices

for index in $card_indices
do
 
    # echo "1.5"
    echo $index
    # This may have to be updated on as needed basis to ensure all info makes
    # it for each cards information......
    CARD_NUM_LINES=60

    # Get the card name and active profile
    card_info=$(pactl list cards | grep -A$CARD_NUM_LINES "^Card #$index" | grep -E "(alsa.card_name|Active Profile)")
    # echo "2"
    echo $card_info

    # Extract the card name and active profile
    card_name=$(echo "$card_info" | grep "alsa.card_name" | cut -d '"' -f 2)
    profile=$(echo "$card_info" | grep "Active Profile" | xargs)
    # echo "3"
    echo $card_name

    # echo "4"
    echo $profile

    # Save the card name and active profile
    echo "$index $profile" >> $filename
done

