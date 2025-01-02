#!/bin/bash

# This script demonstrates a race condition in shell scripting.

# Create two files
touch file1.txt
touch file2.txt

# Use a subshell to simulate concurrent processes
(echo "Content 1" > file1.txt &) 
(echo "Content 2" > file2.txt &) 

# Wait for both processes to finish
wait

# Check contents of files
cat file1.txt
cat file2.txt

# The problem is that we may only see "Content 1" or "Content 2" or both in the file1.txt and file2.txt. This is because the order of writing is not guaranteed
# because both processes are writing concurrently. This is a race condition.