# Hextra site experiment plan

This file is the current source of truth for unfinished work in
`exp.2026-015.hugo-cad-site`.

## Current accepted baseline

The earlier Blowfish experiment proved that Hugo can generate CAD routes from
model-owned metadata, but it did not prove a shared CAD/Forge presentation base
and its experiment completion did not require a visible public page.

## Active workstream

### Hextra end-to-end proof

Status: **in progress**.

Pinned inputs:

- Hextra v0.13.0;
- CAD source b627544423523ce54d2366ad4ae52d233532c54a;
- CAD build scope b00fa56ac62eb34ed405f87a2a4f2dc3efa3d23f;
- Forge source 156a4bfd316dbe711932f58990328e5711385751.

Acceptance:

1. PR build succeeds with no Blowfish module and no Node/npm step.
2. CAD proof page renders actual SCPF source, generated commands, build image
   and provenance.
3. Forge proof page renders actual docs/api.md with Hextra docs navigation.
4. Main deploy succeeds to GitHub Pages.
5. Post-deploy verify-live fetches the public homepage, CAD route and Forge API
   route over HTTPS and checks their source content.
6. Only after step 5: mark this plan and README completed and record the
   evidence in meta.cad.solidcraft.

## Next checkpoint

Public Pages verification. Do not close experiment issue #3 before that check is
green.
