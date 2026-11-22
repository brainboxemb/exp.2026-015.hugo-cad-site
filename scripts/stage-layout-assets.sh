#!/usr/bin/env bash
# Stage the real Simple MFT visual references used by the layout concept.
#
# The workflow already checks out immutable CAD source/build revisions under
# sources/. Keep the page itself independent from the live dev-ci Pages site:
# screenshots must render the pinned evidence, not hotlink mutable routes.
set -euo pipefail

target="static/layout-assets/simple-mft"
mkdir -p "$target"

cp   sources/cad-build/dev-ci/models/advanced/simple_mft/models/simple-mft/model.png   "$target/model.png"

cp   sources/cad/models/advanced/simple_mft/expected-top-view.svg   "$target/expected-top-view.svg"

cp sources/notes/projects/2026/011-simple-mft/images/craftmaker-s30-top-reference-w320.webp "$target/product-reference.webp"

test -s "$target/model.png"
test -s "$target/expected-top-view.svg"
test -s "$target/product-reference.webp"
