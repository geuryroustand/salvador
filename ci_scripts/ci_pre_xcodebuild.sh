
#!/bin/sh

echo "Stage: PRE-Xcode Build is activated .... "

# Move to the place where the scripts are located.
# This is important because the position of the subsequently mentioned files depend of this origin.

echo $CI_WORKSPACE

#cd $CI_WORKSPACE/ci_scripts || exit 1



# Write a JSON File containing all the environment variables and secrets.

printf "{\"OPEN_AI_API_KEY\":\"%s\"}" "$OPEN_AI_API_KEY" >> ../salvador/Secrets/APISecret.json
# Create the Secrets directory if it doesn't already exist

#mkdir -p ../salvador/Secrets

# Write a JSON file containing all the environment variables and secrets.
#echo "{\"OPEN_AI_API_KEY\":\"$OPEN_AI_API_KEY\"}" | jq '.' >> ../salvador/Secrets/APISecret.json

#json="{\"OPEN_AI_API_KEY\":\"$OPEN_AI_API_KEY\"}"

# Write the JSON content to the file
#printf "$json" >> ../salvador/Secrets/APISecret.json

echo "Wrote APISecret.json file."

echo "Stage: PRE-Xcode Build is DONE .... "

exit 0
