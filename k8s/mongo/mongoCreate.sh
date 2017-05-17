k8sdir=`dirname ${0}`

. ${k8sdir}/../../devtest-helpers/utils/k8shelper.sh
NAMESPACE=${1:-sysibm-adm}

VIRTUAL_IP=$2

NODENUM=$3

rm -f ${k8sdir}/mongo-pv-${NODENUM}.yaml
rm -f ${k8sdir}/mongo-pvc-${NODENUM}.yaml
rm -f ${k8sdir}/mongo-deploy-${NODENUM}.yaml
rm -f ${k8sdir}/mongo-svc-${NODENUM}.yaml

sed -e "s~<num>~${NODENUM}~g" ${k8sdir}/mongo-pv.yaml >  ${k8sdir}/mongo-pv-${NODENUM}.yaml
sed -e "s~<num>~${NODENUM}~g" ${k8sdir}/mongo-pvc.yaml >  ${k8sdir}/mongo-pvc-${NODENUM}.yaml
sed -e "s~<num>~${NODENUM}~g" ${k8sdir}/mongo-deploy.yaml >  ${k8sdir}/mongo-deploy-${NODENUM}.yaml
sed -e "s~<num>~${NODENUM}~g" ${k8sdir}/mongo-svc.yaml >  ${k8sdir}/mongo-svc-${NODENUM}.yaml

k8s_create "" ${k8sdir}/mongo-pv-${NODENUM}.yaml
k8s_create ${NAMESPACE} ${k8sdir}/mongo-pvc-${NODENUM}.yaml
k8s_create ${NAMESPACE} ${k8sdir}/mongo-deploy-${NODENUM}.yaml
k8s_create ${NAMESPACE} ${k8sdir}/mongo-svc-${NODENUM}.yaml
