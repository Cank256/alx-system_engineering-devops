#!/usr/bin/python3
"""
Module to count and print occurrences of keywords in hot article titles of a
subreddit.
"""
import requests


def count_words(subreddit, word_list, counts={}, after=""):
    """
    Count occurrences of keywords in hot article titles of a subreddit.
    """
    if not counts:
        counts = {word.lower(): 0 for word in word_list}

    url = f"https://www.reddit.com/r/{subreddit}\
        /hot.json?after={after}&limit=100"
    headers = {
        'User-Agent': 'python3:alx-system_engineering-devops:v1.0.0 \
            (by /u/yourusername)'
    }
    response = requests.get(url, headers=headers, allow_redirects=False)

    if response.status_code != 200 and not after:
        return

    data = response.json().get("data", {})
    posts = data.get("children", [])
    for post in posts:
        title = post.get("data", {}).get("title", "").lower()
        for word in word_list:
            counts[word.lower()] += title.split().count(word.lower())

    after = data.get("after", None)
    if after is not None:
        count_words(subreddit, word_list, counts, after)
    else:
        sorted_counts = sorted(
            [(k, v) for k, v in counts.items() if v > 0],
            key=lambda x: (-x[1], x[0])
        )
        for word, count in sorted_counts:
            print(f"{word}: {count}")
