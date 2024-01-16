#!/usr/bin/python3
"""
Module to recursively query the Reddit API for all hot article titles of a
subreddit.
"""
import requests


def recurse(subreddit, hot_list=[], after=""):
    """
    Recursively return a list of titles of all hot articles for a given
    subreddit.
    """
    url = f"https://www.reddit.com/r/{subreddit}\
        /hot.json?after={after}&limit=100"
    headers = {
        'User-Agent': 'python3:alx-system_engineering-devops:v1.0.0 \
            (by /u/calebnkunze)'
    }
    response = requests.get(url, headers=headers, allow_redirects=False)

    if response.status_code != 200:
        return None

    data = response.json().get("data", {})
    hot_list.extend(
        [
            post.get("data", {})
                .get("title") for post in data.get("children", [])
        ]
    )
    after = data.get("after", None)

    if after is not None:
        return recurse(subreddit, hot_list, after)
    return hot_list
