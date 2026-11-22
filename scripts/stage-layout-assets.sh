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

curl   --fail   --location   --retry 3   --retry-delay 1   --silent   --show-error   "https://cdn.myshoptet.com/usr/www.craftmaker.nl/user/documents/upload/Product_description/craftmaker_pro_station_s30_accessories.jpg"   --output "$target/product-reference.jpg"

test -s "$target/model.png"
test -s "$target/expected-top-view.svg"
test -s "$target/product-reference.jpg"
