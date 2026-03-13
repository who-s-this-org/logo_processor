#!/bin/bash

# Find files that were renamed due to collisions (have _N before the extension)
find . -maxdepth 2 -type f -regextype posix-extended -regex '.*_[0-9]+\.[^/]+$' | sort
