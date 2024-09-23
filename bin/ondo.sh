#!/bin/bash

while read -r line; do
  echo ${line}
  if echo ${line} | grep -q --regexp="${1}"; then
    echo "MATCH!"
    ${2} &
  fi
done
