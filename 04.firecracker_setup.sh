#!/bin/bash

echo "Downloading Firecracker Binary"
sleep 4s
ARCH="$(uname -m)"
release_url="https://github.com/firecracker-microvm/firecracker/releases"
latest=$(basename $(curl -fsSLI -o /dev/null -w  %{url_effective} ${release_url}/latest))
curl -L ${release_url}/download/${latest}/firecracker-${latest}-${ARCH}.tgz \
| tar -xz

# Rename the binary to "firecracker"
mv release-${latest}-$(uname -m)/firecracker-${latest}-${ARCH} firecracker

echo "Building Firecracker from Source"
sleep 4s

ARCH="$(uname -m)"

# Clone the firecracker repository
git clone https://github.com/firecracker-microvm/firecracker firecracker_src

# Start docker
sudo systemctl start docker

# Build firecracker
#
# It is possible to build for gnu, by passing the arguments '-l gnu'.
#
# This will produce the firecracker and jailer binaries under
# `./firecracker/build/cargo_target/${toolchain}/debug`.
#
sudo ./firecracker_src/tools/devtool build

# Rename the binary to "firecracker"
sudo cp ./firecracker_src/build/cargo_target/${ARCH}-unknown-linux-musl/debug/firecracker firecracker

echo "firecracker is setted up successfully"