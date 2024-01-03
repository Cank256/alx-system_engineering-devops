#!/usr/bin/python3
"""
This script exports data of all employees' TODO lists to a single JSON file.
"""

import json
import requests

if __name__ == "__main__":
    base_url = 'https://jsonplaceholder.typicode.com/'
    users_url = base_url + 'users'
    todos_url = base_url + 'todos'

    users_response = requests.get(users_url)
    todos_response = requests.get(todos_url)

    users_data = users_response.json()
    todos_data = todos_response.json()

    todo_dict = {}

    for user in users_data:
        user_id = user.get('id')
        username = user.get('username')
        user_tasks = [
            {
                'username': username,
                'task': task.get('title'),
                'completed': task.get('completed')
            } for task in todos_data if task.get('userId') == user_id]
        todo_dict[user_id] = user_tasks

    with open('todo_all_employees.json', 'w') as json_file:
        json.dump(todo_dict, json_file)
