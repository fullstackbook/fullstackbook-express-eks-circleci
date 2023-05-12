LATEST_SHA=$(git rev-parse HEAD)
docker build -t express-eks:$LATEST_SHA .
docker tag express-eks:$LATEST_SHA 207100238581.dkr.ecr.us-east-2.amazonaws.com/express-eks:$LATEST_SHA
docker push 207100238581.dkr.ecr.us-east-2.amazonaws.com/express-eks:$LATEST_SHA
kubectl set image deployment/myapp myapp=207100238581.dkr.ecr.us-east-2.amazonaws.com/express-eks:$LATEST_SHA -n default
