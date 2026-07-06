# Concept

A web-based, explorable map of life on Earth. The whole thing is a **graph**: animals (and plants, etc.) are **nodes**, and the relationships between them are **edges**.

## The three kinds of connection (edge types)
1. **Food web** — predator → prey. "Fox eats rabbit." Directional.
2. **Evolution** — ancestor → descendant / shared lineage. "Wolves and dogs share an ancestor." A tree, deep in time.
3. **Ecological ties** — symbiosis, competition, habitat-sharing, pollination. "Clownfish + anemone."

## Layout — concentric rings of the Geologic Time Scale
The graph is a **cross-section like tree rings / a planet's core**, ringed on the real **GTS**:
- **Radius = geologic time.** The **outer rim is the present**; travel **inward** through
  **Holocene → Pleistocene** (both the Quaternary Period) → the empty **Neogene & Paleogene**
  (the Age of Mammals, no species yet) → the **Cretaceous** dinosaurs near the core.
- Periods/epochs are proper GTS units with absolute dates; the recent layers are separated by
  *epoch* (Holocene vs Pleistocene) since at *period* level they'd both be the Quaternary.
- Empty periods are shown as empty rings, so the 63-Myr gap in the data is honest and visible.
- **A reserved void sits at the centre.** To add periods *older than the dinosaurs*
  (Jurassic, Triassic, Precambrian…), unshift them onto the era list — the new ring is
  inserted just outside the void and the whole wheel **grows bigger outward**. The core
  never collapses. (Driven by `ERAS_IN_TO_OUT`, `VOID_R`, `RING_T` in index.html.)
- **Angle (slice) = place & ecosystem** — Mauritius, Tasmania, North Atlantic, kelp forest,
  African plains, mammoth steppe, Cretaceous North America…
- **Evolution links become radial spokes** running from an extinct animal at the core
  straight out to its living relative on the rim (e.g. T. rex → Modern Birds, one clean spoke).

## Core experience
- Click an animal → it highlights and pulls forward everything connected to it.
- Toggle which connection type you're viewing (food web / evolution / ecology).
- Follow a thread across time and place; click connections in the side card to hop along the web.
- Each node has a card: name, place + era, why it vanished, and a fact.

## Why it's cool
- Turns dry biology into something you *wander through*.
- Same data supports three totally different views (predation map, family tree, ecosystem web).
- Naturally endless — start with 30 animals, grow to thousands.

## Vibe references
- A star map, but every star is an animal.
- The "connections" board from a detective show.
- Tree of life diagrams, but clickable and alive.
