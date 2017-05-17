k8sdir=`dirname ${0}`

. ${k8sdir}/../../devtest-helpers/utils/k8shelper.sh
NAMESPACE=${1:-sysibm-adm}

k8s_create ${NAMESPACE} ${k8sdir}/ms-svc.yaml
k8s_create ${NAMESPACE} ${k8sdir}/ms-deploy.yaml

