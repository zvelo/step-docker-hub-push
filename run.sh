set -e
cd $HOME

if [ ! -n "$DOCKER_EMAIL" ]
then
    error 'Please specify docker email'
    exit 1
fi

if [ ! -n "$DOCKER_USERNAME" ]
then
    error 'Please specify docker username'
    exit 1
fi

if [ ! -n "$DOCKER_PASSWORD" ]
then
    error 'Please specify docker password'
    exit 1
fi

docker login --email="$DOCKER_EMAIL" --password="$DOCKER_PASSWORD" --username="$DOCKER_USERNAME"
docker push $DOCKER_IMAGE_NAME

set -e
