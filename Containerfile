ARG BASE_IMAGE=quay.io/fedora/fedora
ARG FEDORA_VERSION=${FEDORA_VERSION:-40}

# Build from base-main since its our smallest image and we control the tags
FROM ${BASE_IMAGE}:${FEDORA_VERSION} as builder
ARG KERNEL_VERSION=${:-}
ARG FEDORA_VERSION=${FEDORA_VERSION:-}
ARG KERNEL_FLAVOR=${:-}

COPY fetch.sh /

RUN /fetch.sh

FROM scratch as rpms
COPY --from=builder /tmp/rpms /tmp/rpms
