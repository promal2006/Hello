#!/bin/bash

#--- set script options
#    e - exit with non-zero error if any command fails
#    u - treat undefined variables as errors
#    x - print command before running them (trace)
set -e -u -x

export TERM=-dumb
export PATH=$PATH:$PWD/repo

#--- change to directory
pushd repo

#--- build application from local repo
mvn clean package -Dmaven.repo.local=../.m2/repository

#--- back to original directory
popd

#--- copy target to artifacts directory
cp -R repo/target/Hello-1.0-SNAPSHOT.jar artifacts/hello-acceptance.jar

#--- copy yaml to artifacts directory
cp repo/manifest.yml artifacts/

#--- debug: shows they're there
ls -l artifacts