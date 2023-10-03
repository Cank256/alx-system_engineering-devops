#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

/**
 * main - Entry point for a program to create zombie processes.
 *
 * Description:
 * This program demonstrates the creation of zombie processes using the fork()
 * system call. It creates 5 child processes, each displaying a message with
 * its PID and then exiting, becoming a zombie. The parent process sleeps for
 * 10 seconds to allow the zombies to accumulate.
 *
 * Return:
 * Always returns 0.
 */
int main(void)
{
pid_t child_pid;
int i;

for (i = 0; i < 5; i++)
{
child_pid = fork();

if (child_pid == -1)
{
perror("Fork failed");
exit(1);
}

if (child_pid == 0)
{
printf("Zombie process created, PID: %d\n", getpid());
exit(0);
}
}

sleep(10);

return (0);
}
