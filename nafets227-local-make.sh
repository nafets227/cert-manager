helm push _bin/cert-manager-1.17.1-nafets227.tgz oci://ghcr.io/nafets227
make ko-images-push KO_REGISTRY=ghcr.io/nafets227
