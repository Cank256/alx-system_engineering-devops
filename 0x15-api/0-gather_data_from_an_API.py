#!/usr/bin/python3
"""
This script retrieves information about an employee's TODO list progress
from a REST API.
"""

import requests
import sys

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: {} <employee_id>".format(sys.argv[0]))
        sys.exit(1)

    employee_id = sys.argv[1]
    base_url = 'https://jsonplaceholder.typicode.com/'
    user_url = base_url + 'users/{}'.format(employee_id)
    todo_url = base_url + 'todos?userId={}'.format(employee_id)

    user_response = requests.get(user_url)
    todo_response = requests.get(todo_url)

    user_data = user_response.json()
    todo_data = todo_response.json()

    employee_name = user_data.get('name')
    total_tasks = len(todo_data)
    completed_tasks = sum(1 for task in todo_data if task.get('completed'))

    print(
        "Employee {} is done with tasks({}/{}):".format(
            employee_name, completed_tasks, total_tasks
            )
    )

    for task in todo_data:
        if task.get('completed'):
            print("\t{}".format(task.get('title')))
