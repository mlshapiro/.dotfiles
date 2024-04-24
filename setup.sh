#!/bin/bash

case "$(uname -s)" in
   Darwin*)  os="macos";;
   Linux*)   os="linux";;
esac

echo "running setup for ${os}"
./os/${os}/setup.sh
