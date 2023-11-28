#!/bin/bash

# Function to query OpenAI API
query_openai() {
    prompt=$1
    api_key=$BASH_GPT
    response=$(curl -s \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer $api_key" \
        -d '{
                "model": "gpt-3.5-turbo",
                "messages": [
                {
                    "role": "system",
                    "content": "Create a mac os x terminal bash script based on the user prompt. Make a quick description and a command. Your response should be 100% JSON (do not include any introductions or code blocks). Add no extra formatting, like the following template: {\"desc\": \"...description\", \"cmd:\" \"...command\"}."
                },
                {
                    "role": "user",
                    "content": '"$prompt"'
                }
                ]
            }' \
        "https://api.openai.com/v1/chat/completions")

    echo $response
}

# Main script logic
# echo "Enter your description of the desired shell command:"
# read command_description

# Check if there are arguments passed to the script
if [ $# -eq 0 ]; then
    # No arguments passed, ask the user for input
    echo "Enter a prompt:"
    read command_description
else
    # Use the arguments as the prompt
    command_description="$*"
fi

# Escape the prompt for JSON using jq
json_safe_prompt=$(jq -cn --arg str "$command_description" '$str')

echo $json_safe_prompt

# Generating the AI response
ai_response=$(query_openai "$json_safe_prompt")
data=$(echo $ai_response | jq -r '.choices[0].message.content')

actual_command=$(echo $data | jq -r '.cmd')
description=$(echo $data | jq -r '.desc')

# Displaying the information with colors and decoration
echo -e "\033[1;33m----\033[0m"  # Yellow color for decoration
echo -e "\033[1;34m$description\033[0m"  # Green for 'Description' and white for the actual description
echo -e "\033[1;33m› \033[0m\033[1;31m$actual_command\033[0m"    # Green for 'Command' and white for the actual command
# echo -e "\033[1;33m==================================\033[0m"  # Yellow color for decoration
echo -e "\033[1;36mReady? (or 'q' to cancel)\033[0m"  # Cyan color for the confirmation message

# Read a single character, no need to press Enter for 'q'
# read -q key

while read -rsn1 key; do
    # Check if the key is 'q'
    if [ "$key" = "q" ]; then
        exit 0
        break
    else
        eval "$actual_command"
        break
    fi
done
