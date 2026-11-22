# Agent guidance

## Purpose

This is a bounded experiment, not a new production owner.

Read `README.md` and `docs/plan.md` before changing the experiment.

## Language

Repository-maintained engineering text is written in English. User/chat
interaction follows the user's language.

## Write simply

Use normal engineering language. Use the names that exist in the code and in
SolidCraft. Avoid architecture jargon and invented terms.

## Boundaries

- Use real pinned CAD and Forge inputs.
- Do not copy product documentation into this repository when it can be mounted
  or rendered from its owning repository.
- Do not add Node/npm/Tailwind build steps to the consuming experiment.
- Do not turn this repository into CAD-CI or Forge tooling.
- Do not mark the experiment complete because a build artifact exists.
- Completion requires the public GitHub Pages routes to pass the live check.

## Completion

When the live proof is green:

1. record the successful workflow run and public URLs in `docs/plan.md`;
2. update README status to completed;
3. record the decision/evidence in `meta.cad.solidcraft`;
4. leave the experiment readable as evidence of the decision.
