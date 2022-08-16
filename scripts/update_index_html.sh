#!/bin/bash

cd contents || exit 1
dir=$(find * -maxdepth 0 -type f)
cd "$OLDPWD" || exit 1

echo '# My Slides' > public/index.md

for d in $dir; do
  title=$(grep "^#" "contents/${d}" | head -n 1)
  # remove header(#)
  title=${title//\# /}
  echo "- [${title}](https://skanehira.github.io/slides/${d%.md})" >> public/index.md
done

npx marked -o public/index.html -i public/index.md
