# Build path (crawl → walk → run)

Static site the whole way — no server needed, hosts free on GitHub Pages / Netlify.

## Crawl — one HTML file, ~30 animals
- Single `index.html` with inline JS + a graph library.
- Hardcode ~30 nodes and their `eats` edges in a `<script>` block.
- Use **vis-network** or **Cytoscape.js** (both drop-in, force-directed graphs, click handlers).
- Click a node → highlight neighbors, show a side card.
- Deploy: drag folder onto netlify.com/drop. Live in 60 seconds.
- **Goal:** a clickable food web you can show someone.

## Walk — three views + real data files
- Split data into `nodes.json` + `edges.json`, load with fetch.
- Add the toggle: Food Web / Evolution / Ecology (filter by `edge.type`).
- Add images to node cards (Wikimedia).
- Search box to jump to an animal.
- Nicer styling, color nodes by `kind` (mammal/bird/fish/insect).

## Run — big, auto-populated, shareable
- Script pulls species + relationships from Wikidata/GBIF into the JSON files.
- Hundreds → thousands of animals; cluster/level-of-detail so it stays fast.
- Deep-link to a species (`?animal=red-fox`) so people can share.
- Optional: let visitors suggest missing connections.

## Stack recommendation
- **Vanilla HTML/JS + Cytoscape.js** for crawl/walk — least setup, easiest to vibe-code.
- Move to **Vite + a framework** only if it gets big.
- Host free on **GitHub Pages** (git) or **Netlify drop** (drag-and-drop).

## Libraries to look at
- Cytoscape.js — powerful graph rendering, good for large graphs
- vis-network — simplest to start
- D3.js — most control, steeper curve (save for "run")
