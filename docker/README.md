#### Packing Backend
Pack the backend folder with `npm pack {folder name}` to get the wdp-dashboard-backend.tgz, and move it to the [docker folder](/backend/docker) `/backend/docker`

#### Build and push the docker image on the cluster
Use scp to transfer the docker folder to the kubernetes cluster to be deployed to, navigate to the docker folder and run
`docker build -t localhost:5000/dashboard-backend:{version} .`

This will take your tgz file and use it to build the docker images, while downloading the npm registry. Push the docker file with 
`docker push localhost:5000/dashboard-backend:{version}`

#### Update and run scripts
Assuming that the image is updated, will need to change the scripts in the [k8s folder](/k8s). Go to the [k8s folder](/k8s), find `dash-back-deploy.yaml` and update the line
```
      - name: dash-back
        image: localhost:5000/dashboard-backend:{old-version}
```
to use the new version number.

scp the k8s folder to cluster, navigate to the k8s folder.

If you need to kill the all the old dashboard components, run
`./killDash.sh`, then run `./dashBoard.sh`

If you want to just delete and recreate the backend,
```
kubectl delete deployment dash-back-deploy --namespace=$NAMESPACE
kubectl delete svc dash-back-svc --namespace=$NAMESPACE
kubectl create -f dash-back-deploy.yaml --namespace=$NAMESPACE
kubectl create -f dash-back-svc.yaml --namespace=$NAMESPACE
```
Replace namespace with appropiate ones.
