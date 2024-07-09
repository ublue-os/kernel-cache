#!/usr/bin/bash

set -eoux pipefail

kernel_version="${KERNEL_VERSION}"
kernel_flavor="${KERNEL_FLAVOR}"

dnf install -y dnf-plugins-core

case "$kernel_flavor" in
    "asus")
        dnf copr enable -y lukenukem/asus-kernel
        ;;
    "fsync")
        dnf copr enable -y sentry/kernel-fsync
        ;;
    "surface")
        dnf config-manager --add-repo=https://pkg.surfacelinux.com/fedora/linux-surface.repo
        ;;
    "coreos-stable")
        ;;
    "coreos-testing")
        ;;
    "main")
        ;;
    *)
        echo "unexpected kernel_flavor ${kernel_flavor} for query"
        ;;
esac

if [[ "${kernel_flavor}" =~ asus|fsync ]]; then
    dnf download -y \
        kernel-"${kernel_version}" \
        kernel-core-"${kernel_version}" \
        kernel-modules-"${kernel_version}" \
        kernel-modules-core-"${kernel_version}" \
        kernel-modules-extra-"${kernel_version}" \
        kernel-devel-"${kernel_version}" \
        kernel-devel-matched-"${kernel_version}" \
        kernel-uki-virt-"${kernel_version}"
elif [[ "${kernel_flavor}" == "surface" ]]; then
    dnf download -y \
        kernel-surface-"${kernel_version}" \
        kernel-surface-core-"${kernel_version}" \
        kernel-surface-modules-"${kernel_version}" \
        kernel-surface-modules-core-"${kernel_version}" \
        kernel-surface-modules-extra-"${kernel_version}" \
        kernel-surface-devel-"${kernel_version}" \
        kernel-surface-devel-matched-"${kernel_version}"
else
    KERNEL_MAJOR_MINOR_PATCH=$(echo "$kernel_version" | cut -d '-' -f 1)
    KERNEL_RELEASE="$(echo "$kernel_version" | cut -d - -f 2 | cut -d . -f 1).$(echo "$kernel_version" | cut -d - -f 2 | cut -d . -f 2)"
    ARCH=$(uname -m)
    dnf download -y \
        https://kojipkgs.fedoraproject.org//packages/kernel/"$KERNEL_MAJOR_MINOR_PATCH"/"$KERNEL_RELEASE"/"$ARCH"/kernel-"$kernel_version".rpm \
        https://kojipkgs.fedoraproject.org//packages/kernel/"$KERNEL_MAJOR_MINOR_PATCH"/"$KERNEL_RELEASE"/"$ARCH"/kernel-core-"$kernel_version".rpm \
        https://kojipkgs.fedoraproject.org//packages/kernel/"$KERNEL_MAJOR_MINOR_PATCH"/"$KERNEL_RELEASE"/"$ARCH"/kernel-modules-"$kernel_version".rpm \
        https://kojipkgs.fedoraproject.org//packages/kernel/"$KERNEL_MAJOR_MINOR_PATCH"/"$KERNEL_RELEASE"/"$ARCH"/kernel-modules-core-"$kernel_version".rpm \
        https://kojipkgs.fedoraproject.org//packages/kernel/"$KERNEL_MAJOR_MINOR_PATCH"/"$KERNEL_RELEASE"/"$ARCH"/kernel-modules-extra-"$kernel_version".rpm \
        https://kojipkgs.fedoraproject.org//packages/kernel/"$KERNEL_MAJOR_MINOR_PATCH"/"$KERNEL_RELEASE"/"$ARCH"/kernel-devel-"$kernel_version".rpm \
        https://kojipkgs.fedoraproject.org//packages/kernel/"$KERNEL_MAJOR_MINOR_PATCH"/"$KERNEL_RELEASE"/"$ARCH"/kernel-devel-matched-"$kernel_version".rpm \
        https://kojipkgs.fedoraproject.org//packages/kernel/"$KERNEL_MAJOR_MINOR_PATCH"/"$KERNEL_RELEASE"/"$ARCH"/kernel-uki-virt-"$kernel_version".rpm
fi

if [[ "${kernel_flavor}" =~ fsync ]]; then
    dnf download -y \
        kernel-headers-"${kernel_version}"
fi

mkdir -p /tmp/rpms

mv /kernel-*.rpm /tmp/rpms
