# Hugo + Blowfish CAD site experiment

This repository is an isolated presentation experiment for
`brainboxemb/2026-011-02.cad.solidcraft`.

The experiment answers one architecture question: can Hugo + Blowfish render
the CAD catalogue **directly from model-owned `model.yml` files**, without a
second Python catalogue or generated Markdown layer?

## Pinned inputs

- Hugo Extended: 0.169.0
- Blowfish: v3.10.0
- CAD metadata source: `f6548557daa77f2e3ebb9e1823e26702e66a8d76`

The build workflow checks out that exact CAD commit under `sources/cad/`.
Hugo mounts `sources/cad/models` into its data tree. The content adapter at
`content/models/_content.gotmpl` creates the public model routes in memory.

No CAD is executed here and this repository does not own CAD-CI or durable
build publication.

## Mapping

```text
models/basic/plate/model.yml
  -> /models/plate/

models/components/guide_rail/model.yml
  -> /models/guide-rail/
  -> /models/guide-rail-makita/

models/advanced/simple_mft/model.yml
  -> /models/simple-mft/
  -> /models/simple-mft-assembly/
```

Single-variant slugs are derived mechanically from their physical root
directory by replacing underscores with hyphens. Multi-variant public slugs are
already the keys in `model.yml:variants`.

The demo also creates the existing category routes:
`/models/basic/`, `/models/components/`, and `/models/advanced/`.
