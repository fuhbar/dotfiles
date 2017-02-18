# Exepects a pod name, finds out on which host this pod is running and gcloud ssh into it
function gcloud_ssh2pod {
    gcloud compute ssh $(kubectl get pod backup-166341119-1r6x5 -o jsonpath="{.spec.nodeName}")
}
