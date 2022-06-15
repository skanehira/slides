#!/bin/bash

file="$1"

cp "./contents/${file}.md" .
npm run build -- "${file}.md" -o "./public/${file}/" --base "/slides/${file}/"
rm -f "${file}.md" 
