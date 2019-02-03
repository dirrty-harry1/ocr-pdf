#!/bin/bash

while [ -n "$1" ] ; do
  INPUT_PATH="$1"  
  FILE_TYPE=$(file -b "$INPUT_PATH")
  if [ "${FILE_TYPE%%,*}" == "PDF document" ] ; then
    ocrmypdf -l deu+eng "$INPUT_PATH" "$INPUT_PATH"
  else
    >&2 echo "${INPUT_PATH} is not a PDF file"
  fi  
  shift
done