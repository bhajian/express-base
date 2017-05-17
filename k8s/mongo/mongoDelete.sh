k8sdir=`dirname ${0}`

. ${k8sdir}/../../devtest-helpers/utils/k8shelper.sh
NAMESPACE=${1:-sysibm-adm}

VIRTUAL_IP=$2

NODENUM=$3
kubectl delete pv mongo-pv-$NODENUM -n $NAMESPACE
kubectl delete pvc mongo-pvc-$NODENUM -n $NAMESPACE
kubectl delete deploy mongo-deploy-$NODENUM -n $NAMESPACE
kubectl delete svc mongo-svc-$NODENUM -n $NAMESPACE
