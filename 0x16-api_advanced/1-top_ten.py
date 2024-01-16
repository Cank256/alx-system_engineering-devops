#!/usr/bin/python3
"""
Module to query the Reddit API and print the titles of the top 10 hot posts of a subreddit.
"""
import requests

def top_ten(subreddit):
    """Print the titles of the first 10 hot posts of a subreddit."""
    url = f"https://www.reddit.com/r/{subreddit}/hot.json?limit=10"
    headers = {'User-Agent': 'python3:alx-system_engineering-devops:v1.0.0 (by /u/calebnkunze)'}
    response = requests.get(url, headers=headers, allow_redirects=False)

    if response.status_code != 200:
        print("None")
        return

    posts = response.json().get("data", {}).get("children", [])
    for post in posts:
        print(post.get("data", {}).get("title"))
