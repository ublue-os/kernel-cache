#!/usr/bin/bash

set -eoux pipefail

kernel_version="${KERNEL_VERSION}".fsync.fc"${FEDORA_VERSION}".x86_64

curl -LsSf -o /etc/yum.repos.d/_copr_sentry-kernel-ba.repo \
    https://copr.fedorainfracloud.org/coprs/sentry/kernel-fsync/repo/fedora-"$(rpm -E %fedora)"/sentry-kernel-fsync-fedora-"$(rpm -E %fedora)".repo

rpm-ostree install -y dnf dnf-plugins-core

dnf download -y \
    kernel-"${kernel_version}" \
    kernel-core-"${kernel_version}" \
    kernel-devel-matched-"${kernel_version}" \
    kernel-modules-"${kernel_version}" \
    kernel-modules-core-"${kernel_version}" \
    kernel-modules-extra-"${kernel_version}" \
    kernel-headers-"${kernel_version}" \
    kernel-devel-"${kernel_version}"

mkdir -p /tmp/rpms

mv /kernel-*.rpm /tmp/rpms
