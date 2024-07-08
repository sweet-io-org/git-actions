#!/bin/bash

version=$1
increment=$2
delimiter="."

# Extract the base version (before any suffix like -alpha or -beta)
base_version=$(echo $version | sed -E 's/([0-9]+\.[0-9]+\.[0-9]+).*/\1/')
suffix=$(echo $version | sed -E 's/[0-9]+\.[0-9]+\.[0-9]+(.*)/\1/')

# Split the base version into major, minor, and patch
major=$(echo $base_version | cut -d"$delimiter" -f1)
minor=$(echo $base_version | cut -d"$delimiter" -f2)
patch=$(echo $base_version | cut -d"$delimiter" -f3)

case $increment in
  major)
    major=$((major + 1))
    minor=0
    patch=0
    suffix=""
    ;;
  minor)
    minor=$((minor + 1))
    patch=0
    suffix=""
    ;;
  patch)
    patch=$((patch + 1))
    suffix=""
    ;;
  *)
    echo "Invalid increment type. Use 'major', 'minor' or 'patch'."
    exit 1
    ;;
esac

new_version="$major.$minor.$patch$suffix"
echo $new_version > new_version.txt
