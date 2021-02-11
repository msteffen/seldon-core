#!/bin/ash

if [ $# -eq 0 ]
  then
    echo "USAGE: deploy.sh NAMESPACE MODEL_URI S3_ENDPOINT S3_AUTH USE_SSL MODEL_VERSION"
fi

echo "namespace=${1} model.uri=${2} model.endpoint="${3}" model.auth="${4}" model.ssl="${5}" model.version=${6}"

if helm --namespace=${1} status rsi ; then
    helm --namespace=${1} upgrade rsi /charts/seldon-deployment --set model.uri=${2} --set model.endpoint=${3} --set model.auth=${4} --set model.ssl=${5} --set model.version=${6}
else
    helm --namespace=${1} install rsi /charts/seldon-deployment --set model.uri=${2} --set model.endpoint=${3} --set model.auth=${4} --set model.ssl=${5} --set model.version=${6}
fi
