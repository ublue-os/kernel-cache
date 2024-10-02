# Changelog

## [1.1.0](https://github.com/ublue-os/kernel-cache/compare/v1.0.0...v1.1.0) (2024-10-02)


### Features

* Add support for fsync-ba, an "LTS" version of the fsync kernel. ([fc01d3e](https://github.com/ublue-os/kernel-cache/commit/fc01d3eddffe7115b7e18027493b571a163caf53))
* Cache all the kernels. No Akmods Bootstrap ([#5](https://github.com/ublue-os/kernel-cache/issues/5)) ([83fa7e7](https://github.com/ublue-os/kernel-cache/commit/83fa7e7f92b9912d9ee0cf02ebf59d3056b84ef0))
* **ci:** Add version and kernel release as build tag ([#25](https://github.com/ublue-os/kernel-cache/issues/25)) ([fd5909c](https://github.com/ublue-os/kernel-cache/commit/fd5909c0012ff6e4facc633b84a84992d263b840))
* enable Fedora 41 builds ([#27](https://github.com/ublue-os/kernel-cache/issues/27)) ([a768ce0](https://github.com/ublue-os/kernel-cache/commit/a768ce0a789a638f05746dcad46735197597735b))
* kernel signing cache kernels ([#9](https://github.com/ublue-os/kernel-cache/issues/9)) ([425026e](https://github.com/ublue-os/kernel-cache/commit/425026e978ad379940d5417c80bb5cc8b2ec8f03))


### Bug Fixes

* **ci:** version sort copr provided kernels ([#22](https://github.com/ublue-os/kernel-cache/issues/22)) ([c535a68](https://github.com/ublue-os/kernel-cache/commit/c535a6808b9c06261cbe563f29a23bd0ab873d4b))
* correct invalid variable use on image version label ([#10](https://github.com/ublue-os/kernel-cache/issues/10)) ([a1018ec](https://github.com/ublue-os/kernel-cache/commit/a1018ecf85a991339cecda2044ee1fb544bb5403))
* only use test keys for PR builds ([#19](https://github.com/ublue-os/kernel-cache/issues/19)) ([ae4d5b3](https://github.com/ublue-os/kernel-cache/commit/ae4d5b340499b793aa34e892f65ae16cb8a7aaee))
* ostree.linux label should not be quoted ([#14](https://github.com/ublue-os/kernel-cache/issues/14)) ([78555fe](https://github.com/ublue-os/kernel-cache/commit/78555feb55ef9b5576b84b12d00d44e0fcbfe32d))
* signing key must be used on 'schedule' events ([#15](https://github.com/ublue-os/kernel-cache/issues/15)) ([941e10e](https://github.com/ublue-os/kernel-cache/commit/941e10e8a35a1199a94796769f00a8444f248411))

## 1.0.0 (2024-06-30)


### Features

* initial implementation ([45ecfc7](https://github.com/ublue-os/fsync/commit/45ecfc7d8418d7decc5b17da4f37ac6af16a02fd))
