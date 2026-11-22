# Hextra SolidCraft site experiment

This repository is an isolated presentation experiment for the SolidCraft CAD
and Forge repositories.

## Status

**Proof in progress.**

Do not treat this experiment as complete until the GitHub Actions
`verify-live` job has successfully fetched the public GitHub Pages routes over
HTTPS.

## Question

Can one pinned Hextra release provide a small shared Hugo shell while CAD and
Forge keep different page types?

The proof deliberately uses real source:

- Hextra `v0.13.0`;
- CAD source `b627544423523ce54d2366ad4ae52d233532c54a`;
- CAD build scope `b00fa56ac62eb34ed405f87a2a4f2dc3efa3d23f`;
- Forge source `156a4bfd316dbe711932f58990328e5711385751`.

## Proof pages

- `/models/plate/` — custom CAD layout showing the actual SCPF Python source,
  generated SolidCraft commands, build image and provenance.
- `/docs/forge-api/` — Hextra's documentation layout rendering the actual
  Forge `docs/api.md`.

There is no Node/npm build in this repository. Hextra is consumed as a pinned
Hugo Module.

The workflow publishes to GitHub Pages and then checks the public routes. A
successful Hugo build by itself is not acceptance.
