# Hextra site experiment plan

This file records the accepted result of
`exp.2026-015.hugo-cad-site`.

## Status

**Complete — 2026-11-22.**

Accepted workflow run:

`45032914709`

Accepted public routes:

- https://brainboxemb.github.io/exp.2026-015.hugo-cad-site/
- https://brainboxemb.github.io/exp.2026-015.hugo-cad-site/models/plate/
- https://brainboxemb.github.io/exp.2026-015.hugo-cad-site/docs/forge-api/

## Accepted inputs

- Hextra v0.13.0;
- CAD source b627544423523ce54d2366ad4ae52d233532c54a;
- CAD build scope b00fa56ac62eb34ed405f87a2a4f2dc3efa3d23f;
- Forge source 156a4bfd316dbe711932f58990328e5711385751.

## Accepted evidence

The PR build proved:

- the Hextra module is exactly v0.13.0;
- Blowfish is absent from the module graph;
- no Node/npm build step is required;
- the CAD Plate route contains the actual SCPF source;
- the CAD Plate route contains accepted generated SolidCraft commands;
- the CAD Plate route contains accepted provenance;
- the Forge route renders the actual Forge docs/api.md.

Main run `45032914709` then proved:

- Hugo build success;
- GitHub Pages deployment success;
- post-deploy HTTPS retrieval success for all three public proof routes;
- expected CAD source/command content is present on the live CAD route;
- expected Forge API content is present on the live Forge route.

## Conclusion

Use Hextra as the shared Hugo base for the SolidCraft CAD/Forge site family.

Keep the shared layer small. CAD keeps custom model/catalog layouts. Forge uses
the normal Hextra documentation layout for API/reference/guides where it fits.

The next work belongs in the consumer repositories and shared
`meta.cad.solidcraft` conventions. Do not expand this experiment into a
production owner.
