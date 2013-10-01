#!/bin/bash
now=`date +"%D-%T"`
v="$(cat version)"
echo "${v%.*}.$((${v##*.}+1))" > version
git ci version -m "[deploy] Bump version"
v="$(cat version)"
echo deploying new version: $v
git tag -a v$v -m "Deployment from $now, v$v"
mrt deploy summit2014.reversim.com --settings settings.prod.json
#git push --tags
