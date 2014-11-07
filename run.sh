set -e;

if [ ! -n "$WERCKER_DOCKER_HUB_PUSH_USERNAME" ]
then
    error 'Please specify docker username';
    exit 1;
fi

if [ ! -n "$WERCKER_DOCKER_HUB_PUSH_PASSWORD" ]
then
    error 'Please specify docker password';
    exit 1;
fi

if [ ! -n "$WERCKER_DOCKER_HUB_PUSH_EMAIL" ]
then
    error 'Please specify docker email';
    exit 1;
fi

if [ ! -n "$WERCKER_DOCKER_HUB_PUSH_IMAGE" ]
then
    error 'Please specify docker image';
    exit 1;
fi

docker load -i ${WERCKER_ROOT}/${WERCKER_DOCKER_HUB_PUSH_IMAGE}.tar
docker login -u $WERCKER_DOCKER_HUB_PUSH_USERNAME -p $WERCKER_DOCKER_HUB_PUSH_PASSWORD -e $WERCKER_DOCKER_HUB_PUSH_EMAIL
docker push $WERCKER_DOCKER_HUB_PUSH_IMAGE
