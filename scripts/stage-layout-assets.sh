#!/usr/bin/env bash
# Stage presentation-only reference images that are not owned by the CAD source
# or durable CAD build scope.
#
# Model PNGs, expected views, commands and native artifacts are mounted directly
# from the pinned CAD repositories. Only the cached external product reference
# needs to be copied into the generated site.
set -euo pipefail

target="static/layout-assets/simple-mft"
mkdir -p "$target"

cp   sources/notes/projects/2026/011-simple-mft/images/craftmaker-s30-top-reference-w320.webp   "$target/product-reference.webp"

test -s "$target/product-reference.webp"
