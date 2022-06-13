#!/bin/bash

cd contents || exit 1
dir=$(find * -maxdepth 0 -type f)
cd "$OLDPWD" || exit 1

for d in $dir; do
  echo "- https://skanehira.github.io/slides/${d%.md}" >> public/index.md
done

npx marked -o public/index.html -i public/index.md
