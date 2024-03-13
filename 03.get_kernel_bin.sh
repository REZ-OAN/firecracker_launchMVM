#!/bin/bash

ARCH="$(uname -m)"

# Download a linux kernel binary
wget https://s3.amazonaws.com/spec.ccfc.min/firecracker-ci/v1.8/${ARCH}/vmlinux-5.10.209
