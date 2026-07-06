# Open questions / holes

## Scope
- **Just animals, or all life?** Food webs need plants (producers) + decomposers to make sense. Maybe include plants/fungi as node `kind`s from the start.
- **How global?** One giant world web, or pick a biome/ecosystem at a time (e.g. "African savanna", "coral reef") so it stays legible?

## Data
- Where does relationship data come from at scale? Food-web datasets exist (GloBI — Global Biotic Interactions) but are messy. Evolution = tree of life (Open Tree of Life API).
- Hand-authoring is accurate but slow; auto-pull is fast but noisy. Probably: curated core + optional auto-expand.
- Licensing on images — Wikimedia Commons is safe/free; check each.

## UX
- A full tree of life is HUGE. How to not overwhelm? Start zoomed on one animal, expand outward on click.
- Mixing three edge types in one view = spaghetti. Toggle is the answer, but confirm it feels good.
- Mobile: graphs are hard on small screens. Needed, or desktop-first?

## Naming
- "World Life Web" vs "Web of Life" vs "Bestiary" vs "EcoWeb". Decide before it ships.

## Nice-to-haves (later)
- Time slider for evolution view (watch lineages branch).
- "What if this animal went extinct?" — highlight the cascade through the food web.
- Sound/ambient per biome.
