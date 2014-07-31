set -e

local user="$WERCKER_DOCKER_HUB_PUSH_USERNAME";
local pass="$WERCKER_DOCKER_HUB_PUSH_PASSWORD";
local email="$WERCKER_DOCKER_HUB_PUSH_EMAIL";
local image="$WERCKER_DOCKER_HUB_PUSH_IMAGE";

if [ ! -n "$email" ]
then
    error 'Please specify docker email'
    exit 1
fi

if [ ! -n "$user" ]
then
    error 'Please specify docker username'
    exit 1
fi

if [ ! -n "$pass" ]
then
    error 'Please specify docker password'
    exit 1
fi

docker login --email="$email" --password="$pass" --username="$user"
docker push $image

set -e
