#!/bin/bash
if test "$OS" = "Windows_NT"
then
  # todo?
  :
else
  # use mono
  echo "Starting server"
  mono build/kestrel-classic.exe 2> errorOutput.log > output.log &
  pid=$!

  wait "$pid"
  kill -9 "$pid"

  echo "Output:"
  cat output.log

  echo "Error Output:"
  cat errorOutput.log

  if [[ $(find errorOutput.log -type f -size +1c 2>/dev/null) ]]; then
    exit 1
  fi
fi
