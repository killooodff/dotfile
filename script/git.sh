#!/bin/bash

cd
cd "$HOME/dotfile"

echo "Коммит:"
read com

git add .
git commit -m "$com"
git push
