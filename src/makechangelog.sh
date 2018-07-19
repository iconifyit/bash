#!/bin/bash

function makechangelog
{
  pushd "$(git rev-parse --show-toplevel)" >/dev/null
  git log $order --pretty=format:"%h %ad | %s%d [%an]" --date=short > CHANGELOG.txt
  popd > /dev/null
}
