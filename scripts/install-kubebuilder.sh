
#!/usr/bin/env bash

# ./scripts/install-kubebuilder.sh
#
# Installs kubebuilder and envtest binaries if not installed.
#
# NOTE: uses `sudo mv` to relocate kubebuilder binaries to /usr/local

curl -L -o kubebuilder https://go.kubebuilder.io/dl/latest/$(go env GOOS)/$(go env GOARCH)
chmod +x kubebuilder && mv kubebuilder /usr/local/bin/
k8s_version="${ENVTEST_K8S_VERSION:-1.19.2}"
goarch="$(go env GOARCH)"
goos="$(go env GOOS)"
envtest_tools_archive_name="kubebuilder-tools-$k8s_version-$goos-$goarch.tar.gz"
envtest_tools_download_url="https://storage.googleapis.com/kubebuilder-tools/$envtest_tools_archive_name"
curl -sL ${envtest_tools_download_url} -o "/tmp/$envtest_tools_archive_name"
tar -C /tmp/kubebuilder --strip-components=1 -zvxf "$envtest_tools_archive_path"
sudo mv /tmp/kubebuilder /usr/local