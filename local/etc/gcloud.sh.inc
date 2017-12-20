#--------------------------------------------------------------------------
# Wrapper to kubectl which considers environment variables.
kctl() {
    CTX=${KUBECTL_CONTEXT:-$(kubectl config current-context)}
    NS=${KUBECTL_NAMESPACE:-"default"}
    kubectl --context=$CTX --namespace=$NS
}
#--------------------------------------------------------------------------
# Expects a pod name, finds out on which host this pod is running and gcloud
# ssh into it
gcloud_ssh2pod() {
    if [[ -z "$1" ]] ; then
        echo "Error: missing argument: usage: gcloud_ssh2pod <pod> " >/dev/stderr; return 1
    fi
    NS="$(kctl get pods --all-namespaces | grep $1 | awk '{print $1}')"
    POD="$(kctl get pods --all-namespaces | grep $1 | awk '{print $2}')"
    gcloud compute ssh $(kctl -n $NS get pod $POD -o jsonpath="{.spec.nodeName}")
}

#--------------------------------------------------------------------------
# Expects pod name, finds node name, ssh to node name, get docker logs for each
# of the container
gcloud_pod_logs() {
    if [[ -z "$1" ]] ; then
        echo "Error: missing pod name as sole argument" >/dev/stderr; return 1
    fi
    NS="$(kctl get pods --all-namespaces | grep $1 | awk '{print $1}')"
    POD="$(kctl get pods --all-namespaces | grep $1 | awk '{print $2}')"
    gcloud compute ssh $(kctl -n $NS get pod $POD -o jsonpath="{.spec.nodeName}") -- "bash -c 'docker ps -a -q --format=\"{{.ID}} {{.Names}}\" | grep $POD | while read id name; do echo -e \"\nDOCKER LOGS OF: \$name\n==================================================================\"; docker logs --tail=50 \$id; done'"
}

alias glcoud=gcloud
alias k='kubectl --context=${KUBECTL_CONTEXT:-$(kubectl config current-context)} --namespace=${KUBECTL_NAMESPACE:-"default"}'
alias k-gpa='kubectl --context=${KUBECTL_CONTEXT:-$(kubectl config current-context)} --namespace=${KUBECTL_NAMESPACE:-"default"} get --all-namespaces pods -o=custom-columns=NS:.metadata.namespace,POD:.metadata.name,POD-IP:.status.podIP,NODE:.spec.nodeName,NODE-IP:.status.hostIP'
alias helm='helm "--kube-context=${KUBECTL_CONTEXT:-$(kubectl config current-context)}"'
alias helmfile='helmfile "--kube-context ${KUBECTL_CONTEXT:-$(kubectl config current-context)}"'
