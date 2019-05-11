#!/bin/bash

#--- set script options
#    e - exit with non-zero error if any command fails
#    u - treat undefined variables as errors
#    x - print command before running them (trace)
set -e -u -x

export TERM=-dumb

#export GRADLE_OPTS=-Dorg.gradle.native=false
export PATH=$PATH:$PWD/repo

pushd repo

mvn test -Dmaven.repo.local=../.m2/repository

popd