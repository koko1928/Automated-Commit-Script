# Automated Commit Script

This Bash script can be used to automatically commit to a GitHub repository. The script reads configuration information from the .env file and commits to the repository with random comments. Additionally, it logs the commit message and timestamp in the script's log to track whether it was pushed to GitHub.

## Usage

1. To use this script, create a .env file and set your GitHub access token, username, and repository name.

    ```plaintext
    # .env file
    USERNAME="YourGitHubUsername"
    REPO_NAME="YourRepositoryName"
    ACCESS_TOKEN="YourGitHubAccessToken"
    ```

   Add the required information to the .env file and place it in the same directory as the script.

2. Run the Bash script.

    ```bash
    bash auto_commit.sh
    ```

   The script will commit with random comments for the specified maximum commit count and push to the GitHub repository. Each commit will also be logged in the script's log.

3. The script will introduce a random break time and take a break within the specified maximum break time. Afterward, it will resume committing.

4. The script's log will be recorded in the format `Commit Log for [Date]`, including the committed content and its timestamp on GitHub.

## Customization

- `MAX_COMMITS_PER_DAY`: Set the maximum number of commits per day.
- `MAX_BREAK_TIME`: Set the maximum break time in seconds per day.
- `DICTIONARY`: Set a list of random comments to use in commit messages.

You can customize this script to adjust automated commits to your GitHub repository. For more detailed customization options, refer to the comments in the script.
