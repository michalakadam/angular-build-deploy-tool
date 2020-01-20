#!/bin/bash

echo "Remote server triggered, attempting to pull changes from remote repository."

cd $1

git pull $2 master
