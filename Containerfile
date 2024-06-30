ARG SOURCE_IMAGE=${SOURCE_IMAGE:-base}
ARG SOURCE_REPO=${SOURCE_REPO:-fedora-ostree-desktops}
ARG BASE_IMAGE=quay.io/${SOURCE_REPO}/${SOURCE_IMAGE}
ARG FEDORA_VERSION=${FEDORA_VERSION:-40}

# Build from base-main since its our smallest image and we control the tags
FROM ${BASE_IMAGE}:${FEDORA_VERSION} as builder
ARG KERNEL_VERSION=${:-}
ARG FEDORA_VERSION=${FEDORA_VERSION:-}

COPY fetch.sh /

RUN /fetch.sh

FROM scratch as rpms
COPY --from=builder /tmp/rpms /tmp/rpms
