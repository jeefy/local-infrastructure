#!/bin/bash

# Assuming this is being run in the correct directory

find . -type f -name \*.yaml -print0 | while read -d $'\0' file
do
  if [[ $file =~ .*configmap.* ]]; then
    echo "-- Configmap found";
    if ! kubectl get -f $file > /dev/null 2>&1; then
      #kubectl apply -f "$file"
      echo "kubectl apply -f \"$file\""
    else
      #kubectl replace -f "$file"
      echo "kubectl replace -f \"$file\""
    fi
  else
    echo "kubectl apply -f $file"
    #kubectl apply -f "$file"
  fi
done

