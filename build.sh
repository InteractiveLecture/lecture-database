#!/bin/bash
set -ev
docker build -t openservice/lecture-database:latest .
cd testdb && docker build -t openservice/lecture-testdatabase:latest .

if [ "${TRAVIS_PULL_REQUEST}" = "false" ] && [ "${TRAVIS_REPO_SLUG}" = "InteractiveLecture/lecture-database" ] ; then
  docker login -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD" -e="$DOCKER_EMAIL"
  docker push openservice/lecture-database:latest
  docker push openservice/lecture-testdatabase:latest
fi
