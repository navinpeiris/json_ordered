# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.2.0] - 2026-06-05

### Fixed

- Restore compatibility with Elixir 1.20, which removed the internal `:elixir_json`
  module that the encoder previously relied on. JSON keys are now encoded with the
  public `JSON.encode!/1`, which works across Elixir 1.18 and later.

## [0.1.0] - 2025-01-19

### Added

- Initial release: the `JSONOrdered` struct and a `JSON.Encoder` implementation that
  preserves the order of keys when encoding to JSON.

[0.2.0]: https://github.com/navinpeiris/json_ordered/compare/v0.1.0...v0.2.0
[0.1.0]: https://github.com/navinpeiris/json_ordered/releases/tag/v0.1.0
