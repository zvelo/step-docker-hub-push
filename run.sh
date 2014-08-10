set -e;

if [ ! -n "$WERCKER_DOCKER_HUB_PUSH_USERNAME" ]
then
    error 'Please specify docker username';
    exit 1;
fi

if [ ! -n "$WERCKER_DOCKER_HUB_PUSH_PONE" ]
then
    error 'Please specify docker password';
    exit 1;
fi

if [ ! -n "$WERCKER_DOCKER_HUB_PUSH_PTWO" ]
then
    error 'Please specify docker password';
    exit 1;
fi

if [ ! -n "$WERCKER_DOCKER_HUB_PUSH_PTHREE" ]
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

TARFILE="${WERCKER_DOCKER_HUB_PUSH_IMAGE/\//-}"

docker load -i ${WERCKER_ROOT}/${TARFILE}

PASSWORD=$WERCKER_DOCKER_HUB_PUSH_PONE\$$WERCKER_DOCKER_HUB_PUSH_PTWO\$$WERCKER_DOCKER_HUB_PUSH_PTHREE
docker login -u $WERCKER_DOCKER_HUB_PUSH_USERNAME -p $PASSWORD -e $WERCKER_DOCKER_HUB_PUSH_EMAIL
docker push $WERCKER_DOCKER_HUB_PUSH_IMAGE
exit 0
