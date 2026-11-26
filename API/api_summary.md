# API Summary

## 1. What is a REST API?

A REST API (Representational State Transfer API) allows applications to communicate with each other over HTTP. It uses methods such as GET, POST, PUT, and DELETE to exchange data.

## 2. HTTP Status Codes

- **200 OK:** The request was successful.
- **404 Not Found:** The requested resource could not be found.

## 3. What is jq?

jq is a command-line tool used to process and filter JSON data.

## 4. Explanation of jq Command

Command:

`cat API/github_profile.json | jq '{name:.name, repos:.public_repos, followers:.followers, joined:.created_at}'`

Explanation:

- `cat`: Reads the JSON file.
- `|`: Sends output to the next command.
- `jq`: Processes JSON data.
- `.name`: GitHub account name.
- `.public_repos`: Number of public repositories.
- `.followers`: Number of followers.
- `.created_at`: Account creation date.
