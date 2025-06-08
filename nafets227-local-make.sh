#/bin/env bash
#
# make cert-manager and publish to ghcr.io/nafetss27
make _bin/release-version release-artifacts || exit 1
VERSION=$(cat _bin/release-version | sed 's_^v__' ) || exit 1

echo "Ready to push version $VERSION ..."
[ -t 0 ] && read -r -p "Press Enter to Continue, use Ctrl-C to break."

helm push _bin/cert-manager-$VERSION.tgz oci://ghcr.io/nafets227
make ko-images-push KO_REGISTRY=ghcr.io/nafets227
