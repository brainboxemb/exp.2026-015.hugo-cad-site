# Hextra SolidCraft site experiment

This repository is an isolated presentation experiment for the SolidCraft CAD
and Forge repositories.

## Status

**Accepted Hextra/CAD presentation proof.**

Accepted workflow run: #80 (`45069974361`).

That run built the site, published the exact generated tree to `gh-pages`,
deployed GitHub Pages and verified the public routes over HTTPS.

The final publication gate is:

1. build the site with pinned Hextra `v0.13.0`;
2. publish the exact generated `public/` tree to the orphan `gh-pages` branch;
3. deploy the checked-out `gh-pages` branch to GitHub Pages;
4. fetch the public homepage, CAD model page and Forge API page over HTTPS.

Public proof:

- https://brainboxemb.github.io/exp.2026-015.hugo-cad-site/
- https://brainboxemb.github.io/exp.2026-015.hugo-cad-site/models/plate/
- https://brainboxemb.github.io/exp.2026-015.hugo-cad-site/models/simple-mft/
- https://brainboxemb.github.io/exp.2026-015.hugo-cad-site/docs/forge-api/

## Result

Hextra can provide one small shared Hugo shell while CAD and Forge keep
different page types.

The proof uses real pinned source:

- Hextra `v0.13.0`;
- CAD source `b627544423523ce54d2366ad4ae52d233532c54a`;
- CAD build scope `b00fa56ac62eb34ed405f87a2a4f2dc3efa3d23f`;
- Forge source `156a4bfd316dbe711932f58990328e5711385751`.

The CAD proof uses one generic model-detail layout for both Plate and Simple
MFT. It shows:

- actual SCPF Python source, collapsed by default;
- actual generated SolidCraft commands, collapsed by default;
- actual SolidCraft build images;
- actual provenance and verification state;
- model-owned Background/reference content when present.

Rendered screenshot evidence for Plate and Simple MFT is produced by the normal
CI workflow before publication.

The Forge proof page uses Hextra's normal documentation layout and renders the
actual Forge `docs/api.md`, including its code blocks and section structure.

There is no Node/npm build step in this repository. Hextra is consumed as a
pinned Hugo Module.

## Boundary proven by the experiment

Shared Hextra layer:

- page shell;
- navigation;
- documentation sidebar and table of contents;
- search and theme controls;
- code rendering;
- shared base styling.

Repository-owned page types:

- CAD model/catalog layouts;
- Forge API/reference/guide content and structure.

The experiment remains public as decision evidence. It is not a production
site owner.
