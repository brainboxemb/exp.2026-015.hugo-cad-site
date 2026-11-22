# Hextra site experiment plan

This file records the accepted result of
`exp.2026-015.hugo-cad-site`.

## Status

**Hextra content proof complete; branch publication correction in progress.**

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
- Forge source 156a4bfd316dbe711932f58990328e5711385751;
- Notes generated image cache e56a0ab01ad9031578d0f3c158309ea2606cd81e for the local Simple MFT product-reference thumbnail.

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


## Publication correction

Generated site output must remain inspectable in the repository.

Accepted publication path:

```text
main source
  -> Hugo/Hextra build
  -> orphan gh-pages branch
  -> Pages artifact created from checked-out gh-pages
  -> GitHub Pages
  -> live HTTPS verification
```

Do not mark the publication correction complete until the `gh-pages` branch
exists, contains the generated CAD and Forge proof pages, and the subsequent
live verification succeeds.


## Model-detail visual verification

The Simple MFT layout concept is verified as a rendered page, not only as
generated HTML.

The PR build:

1. builds the Hugo site normally;
2. serves the generated site from localhost using the production base path;
3. opens `/models/simple-mft-concept/` in the runner's Chrome/Chromium;
4. captures a normal desktop viewport and a tall layout screenshot;
5. uploads those PNG files as the `simple-mft-layout` workflow artifact.

The screenshot script is `scripts/capture-layout.sh`. Keep browser mechanics
there; the workflow should only invoke the script and retain its output.

Presentation screenshots are review evidence. They complement, rather than
replace, HTML/content assertions.


### Current Simple MFT concept

Draft PR #19 is the visual proving ground for the complete Simple MFT detail
page. It stays in this experiment until the page system is stable enough to
port as one coherent change.

Current accepted visual evidence: PR run #66 (`45066184367`).

That rendered proof confirms:

- the model preview, product reference and 2D expectation all load from staged
  pinned evidence; no model-detail screenshot depends on the live `dev-ci`
  site for those visuals;
- preview geometry is independent from heading height and the model no longer
  drops down because of a heading/min-height selector;
- Construction stages uses the same sans-serif body typography and line-height
  as the rest of the CAD page;
- SolidCraft Web, Background, references, source, generated commands,
  verification and downloads use one label/title/body/card hierarchy;
- the page renders the real pinned Simple MFT Python source and all 23 generated
  SolidCraft commands instead of shortened demonstration content;
- the verification panel reflects the accepted provenance values rather than
  placeholder success values.

Do not port the concept to `2026-011-02.cad.solidcraft/dev-ci` piecemeal.
Keep iterating here and move the accepted component/layout system as one unit.


## Generic model-detail cleanup

The generic model-detail route is being brought back toward the calmer accepted
CAD presentation instead of adding more dashboard-style UI.

Tracking:
- #20 — restore the calm generic model-detail layout;
- #21 — remove stray section ordinals and collapse large technical code;
- #22 — simplify build evidence/provenance;
- #23 — capture generic model pages in the rendered screenshot lane.

Visual reference:
- the existing CAD `main` model-detail layout is the presentation baseline;
- Hextra remains the shared shell;
- the work here should fix typography, layout mechanics and reusable Hugo
  structure without increasing information density.

The representative regression route is `/models/plate/`. The Simple MFT
concept stays in the screenshot lane as a second, richer model-detail reference.


### #25 — Simple MFT convergence

The Simple MFT concept now uses the same calm model-detail presentation contract
as the generic Plate route:

- one compact facts row instead of status badges;
- Model preview and Files/Construction stages use the same overview structure;
- Open in SolidCraft Web, Background, reference, source, commands, verification
  and downloads use ordinary document sections;
- SCPF source and SolidCraft commands are collapsed by default;
- build evidence uses the same quiet key/value list;
- the two-column Reference and 2D expectation comparison remains intact.

Accepted rendered proof: PR run #72 (`45068878682`).

That run shows Plate and Simple MFT using the same quiet hierarchy while the
Simple MFT reference comparison, source/command collapse and provenance list
remain intact.

The remaining special template exists only because Simple MFT currently carries
extra experimental content. Do not introduce a second visual system there.
