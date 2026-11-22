# Hextra site experiment plan

This file records the accepted result of
`exp.2026-015.hugo-cad-site`.

## Status

**Hextra/CAD presentation baseline accepted in the experiment.**

Current accepted main deployment before #27:

- run #74 (`45069100466`);
- build, `gh-pages` publication, Pages deployment and live HTTPS verification
  all succeeded.

Accepted public routes:

- https://brainboxemb.github.io/exp.2026-015.hugo-cad-site/
- https://brainboxemb.github.io/exp.2026-015.hugo-cad-site/models/plate/
- https://brainboxemb.github.io/exp.2026-015.hugo-cad-site/models/simple-mft/
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

Model-detail presentation is verified from rendered pages, not only generated
HTML.

The PR build:

1. builds the Hugo site normally;
2. serves the generated site from localhost using the production base path;
3. opens both `/models/plate/` and `/models/simple-mft/` in the runner's
   Chrome/Chromium;
4. captures overview and tall screenshots for both routes;
5. fails if rendered pages request missing local assets;
6. uploads the PNG evidence as the `model-layouts` workflow artifact.

The screenshot mechanics live in `scripts/capture-layout.sh`.

### Accepted model-detail contract

Issues #20–#23 established the calm generic model-detail baseline:

- the existing CAD `main` presentation is the visual reference;
- the model overview uses two quiet panels: Model preview and
  Files/Construction stages;
- Construction stages uses the normal CAD body typography;
- preview geometry is independent from heading height;
- the rest of the page uses ordinary document sections with subtle separators;
- SCPF source and SolidCraft commands are collapsed by default;
- standalone section ordinals are not used;
- command-step ordinals inside the expanded command list remain;
- build and verification evidence is a compact key/value definition list.

### Simple MFT convergence — #25

Simple MFT now uses the **same generic `layouts/models/single.html` template**
as Plate.

Its richer content is data/content rather than a second presentation template:

- model metadata and `extra_views` come from the pinned `model.yml`;
- Background prose lives in `assets/model-details/simple-mft.md`;
- the external product reference resolves through
  `data/cad/reference_cache.yml` to the pinned Notes image cache;
- the 2D expectation is mounted directly from the pinned CAD source;
- model image, commands, native files and provenance come from the pinned CAD
  build scope.

The temporary `/models/simple-mft-concept/` page and its dedicated layout have
been removed.

PR #27 run #78 (`45069700337`) proves the generated Plate and Simple MFT
routes together after that removal.

Do not port individual CSS fixes to
`2026-011-02.cad.solidcraft/dev-ci`. Port the accepted generic layout,
content conventions and screenshot verification as one coherent change.

