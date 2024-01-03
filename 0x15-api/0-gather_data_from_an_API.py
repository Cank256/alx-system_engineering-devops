#!/usr/bin/python3
"""
This module provides functionality to fetch and display the TODO list progress
of an employee from jsonplaceholder.typicode.com given their employee ID.
"""

import requests
import sys


def fetch_todo_list_progress(employee_id):
    """
    Fetches and displays the TODO list progress for the given employee ID.

    Args:
        employee_id (int): The ID of the employee.
    """
    # Fetching user information
    user_url = f"https://jsonplaceholder.typicode.com/users/{employee_id}"
    user_response = requests.get(user_url)
    if user_response.status_code != 200:
        print(f"Failed to retrieve data for user ID {employee_id}.")
        return

    user_data = user_response.json()
    employee_name = user_data.get("name")

    # Fetching TODO list
    todos_url = f"\
        https://jsonplaceholder.typicode.com/users/{employee_id}/todos"
    todos_response = requests.get(todos_url)
    if todos_response.status_code != 200:
        print(f"Failed to retrieve TODO list for user ID {employee_id}.")
        return

    todos = todos_response.json()
    total_tasks = len(todos)
    completed_tasks = sum(1 for task in todos if task.get('completed'))
    the_tasks = completed_tasks / total_tasks
    # Displaying TODO list progress
    print(f"Employee {employee_name} is done with tasks({the_tasks}):")
    for task in todos:
        if task.get('completed'):
            print(f"\t {task.get('title')}")


# Main script execution
if __name__ == "__main__":
    if len(sys.argv) != 2 or not sys.argv[1].isdigit():
        print("Usage: python3 todo_progress.py <employee_id>")
    else:
        employee_id = int(sys.argv[1])
        fetch_todo_list_progress(employee_id)
