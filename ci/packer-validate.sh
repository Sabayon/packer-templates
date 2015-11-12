#!/bin/bash

set -x
set -e

for t in *.json; do
  packer validate "${t}"
done
