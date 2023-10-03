#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(void)
{
    pid_t child_pid;
    int i;

    for (i = 0; i < 5; i++) {
        child_pid = fork();

        if (child_pid == -1) {
            perror("Fork failed");
            exit(1);
        }

        if (child_pid == 0) {
            // Child process
            printf("Zombie process created, PID: %d\n", getpid());
            exit(0);
        }
    }

    // Parent process
    sleep(10); // Sleep for 10 seconds to allow the zombies to accumulate

    return (0);
}
