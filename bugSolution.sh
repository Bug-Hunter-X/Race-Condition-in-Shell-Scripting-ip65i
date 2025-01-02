#!/bin/bash

# This script demonstrates a solution to the race condition in shell scripting.

# Create two files
touch file1.txt
touch file2.txt

# Use a lock file to prevent concurrent access to files
lock_file="lock.lock"

# Write to file1.txt
flock $lock_file -c "echo \"Content 1\" > file1.txt"

# Write to file2.txt
flock $lock_file -c "echo \"Content 2\" > file2.txt"

# Check contents of files
cat file1.txt
cat file2.txt

# The use of flock ensures that only one process can access the file at a time. Therefore, this prevents the race condition from occurring.