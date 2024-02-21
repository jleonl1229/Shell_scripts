#!/bin/bash

read -p "Introduce a message for the commit: " message
git status && git add . && git commit -m "$message" && git push