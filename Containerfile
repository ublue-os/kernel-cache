ARG BASE_IMAGE=quay.io/fedora/fedora
ARG FEDORA_VERSION=${FEDORA_VERSION:-40}

# Build from base-main since its our smallest image and we control the tags
FROM ${BASE_IMAGE}:${FEDORA_VERSION} AS builder
ARG KERNEL_VERSION="${:-6.8.11-300.fc40.x86_64}"
ARG FEDORA_VERSION="${FEDORA_VERSION:-40}"
ARG KERNEL_FLAVOR="${:-coreos-stable}"
ARG DUAL_SIGN="${:-true}"
ARG KERNEL_BUILD_TAG="${:-}"

COPY fetch.sh /tmp
COPY certs /tmp/certs

RUN /tmp/fetch.sh

FROM scratch AS rpms
COPY --from=builder /tmp/rpms /tmp/rpms
