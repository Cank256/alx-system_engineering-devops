#!/usr/bin/python3
"""
Module to query the Reddit API and return the number of subscribers for
a subreddit.
"""
import requests


def number_of_subscribers(subreddit):
    """Return the number of subscribers for a given subreddit."""
    url = f"https://www.reddit.com/r/{subreddit}/about.json"
    headers = {
        'User-Agent': 'python3:alx-system_engineering-devops:v1.0.0 \
            (by /u/calebnkunze)'
    }
    response = requests.get(url, headers=headers, allow_redirects=False)

    if response.status_code != 200:
        return 0

    return response.json().get("data", {}).get("subscribers", 0)
