# Kernel Cache

[![Cache Kernels](https://github.com/ublue-os/kernel-cache/actions/workflows/reusable-build.yml/badge.svg)](https://github.com/ublue-os/kernel-cache/actions/workflows/reusable-build.yml)

A caching layer for the different kernels used by the Universal Blue Project

The artifacts previously produced in this repo were kernel RPMs in `/tmp/rpms/` within the resulting images.

These artifacts are now produced in the [akmods repo](https://github.com/ublue-os/akmods/) with the path of the kernel RPMs in `/kernel-rpms/` in each of the akmods images.
