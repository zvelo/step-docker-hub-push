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


docker_push() {
    set +e;
    local user=$1;
    local pass=$2;
    local email=$3;
    local image=$4;

    docker version
    docker images
    #echo "Email: $email"
    #echo "docker login --username=$user $pass"
    docker login -u $user -p $pass -e $email;
    docker push $image;
    set -e;
}

#docker_push $WERCKER_DOCKER_HUB_PUSH_USERNAME $WERCKER_DOCKER_HUB_PUSH_PASSWORD $WERCKER_DOCKER_HUB_PUSH_EMAIL $WERCKER_DOCKER_HUB_PUSH_IMAGE;

PASSWORD=$WERCKER_DOCKER_HUB_PUSH_PONE\$$WERCKER_DOCKER_HUB_PUSH_PTWO\$$WERCKER_DOCKER_HUB_PUSH_PTHREE
docker login -u $WERCKER_DOCKER_HUB_PUSH_USERNAME -p $PASSWORD -e $WERCKER_DOCKER_HUB_PUSH_EMAIL
docker push $WERCKER_DOCKER_HUB_PUSH_IMAGE

