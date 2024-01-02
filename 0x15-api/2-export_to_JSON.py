#!/usr/bin/python3
"""
This script exports employee's TODO list data to a JSON file.
"""

import requests
import json
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

    employee_name = user_data.get('username')

    json_filename = '{}.json'.format(employee_id)
    with open(json_filename, 'w') as json_file:
        json.dump({
            employee_id: [{
                'task': task.get('title'),
                'completed': task.get('completed'),
                'username': employee_name} for task in todo_data]}, json_file)
