#!/bin/bash

case "$(uname -s)" in
   Darwin*)  os="macos";;
   Linux*)   os="linux";;
esac

echo "Running setup for ${os}"
./os/${os}/setup.sh
