#/bin/bash

DEPLOYMENT="./deploy.sh"

$DEPLOYMENT

DEPLOYMENT-STATUS=$?

if [ $DEPLOYMENT-STATUS -eq 0 ]
    echo "It might have failed please double check it"
    exit 1

    echo " deployment succeded"

    COMMIT_ID=$(git rev-parse HEAD)
    TAG=Deploy_$COMMIT_ID_$(date +%Y%m%d-%H%M%S)

    git tag $TAG

    git push origin $TAG
else
    echo "Deployment Failed"
fi

