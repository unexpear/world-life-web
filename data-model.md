# Data model

Everything is nodes + edges. Keep it dead simple to start: two JSON files (or one).

## Node (a species)
```json
{
  "id": "red-fox",
  "name": "Red Fox",
  "scientificName": "Vulpes vulpes",
  "kind": "mammal",
  "diet": "omnivore",
  "habitat": ["forest", "grassland", "urban"],
  "image": "foxes.jpg",
  "fact": "Can hear a mouse squeak 100ft away."
}
```

## Edge (a connection)
```json
{
  "from": "red-fox",
  "to": "rabbit",
  "type": "eats",          // eats | ancestor-of | symbiosis | competes | pollinates
  "note": "primary prey in spring"
}
```

- `type: "eats"`      → food web (from eats to)
- `type: "ancestor-of"` → evolution (from is ancestor of to)
- `type: "symbiosis"` → mutual benefit
- direction matters for `eats` and `ancestor-of`; not for `symbiosis`/`competes`.

## Why this shape
- One flat list of nodes, one flat list of edges = trivially loadable by any graph library.
- Adding an animal = append one node. Adding a relationship = append one edge.
- The three "views" are just filters on `edge.type`.

## Growing the data
- Start hand-authored (~30 well-known animals).
- Later: pull from Wikipedia / Wikidata / GBIF / Encyclopedia of Life APIs to auto-populate.
- Images: Wikimedia Commons (free), or Unsplash for vibe shots.
