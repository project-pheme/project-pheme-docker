#!/bin/sh

set -ex

export builder_container="$(docker inspect $HOSTNAME | jq '.[0].Id' | tr -d \")"

cp /build/docker-compose.platform.yml /platform/build
cp /build/docker-compose.build.yml /platform/

cd /platform/build
git clone ${GIT_URL_PLATFORM} platform
git clone ${GIT_URL_CLIENT} platform-client
git clone ${GIT_URL_INTERFACE} data-interface

docker-compose -f docker-compose.platform.yml build
docker-compose -f docker-compose.platform.yml run --rm platform
docker-compose -f docker-compose.platform.yml run --rm platform_client

cp -a /build/mysql /platform/mysql
cp -a /build/nginx /platform/nginx
cp -a /build/platform /platform/platform

cd /platform
docker-compose -f docker-compose.build.yml build
