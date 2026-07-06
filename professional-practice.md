# How webs are used professionally — audit + benchmarks

Benchmarking this project against how network/graph ("web") visualizations are actually built and used in professional settings. Sourced July 2026.

## Where webs are used professionally, and WHY
The core reason webs exist: **they make *relationships* first-class.** A table hides the structure
a graph reveals — hubs, clusters, bridges, and cascades. Main professional domains:

- **Ecology / food webs** — nodes = species, edges = who-eats-whom. Used to find **keystone species**
  (high network centrality), predict **secondary extinctions**, and measure **robustness**. Key result:
  ecological networks are robust to *random* loss but **fragile to selective loss of the most-connected
  species**; robustness rises with **connectance**. Tools: Cytoscape, Ecopath with Ecosim, Network3D.
  ([keystone/centrality](https://pmc.ncbi.nlm.nih.gov/articles/PMC5008267/), [robustness & connectance](https://www.academia.edu/73753984/Network_structure_and_biodiversity_loss_in_food_webs_robustness_increases_with_connectance))
- **Systems biology** — protein-interaction & gene-regulatory networks; Cytoscape is the standard.
  WHY: find functional modules and drug targets.
- **Finance / fraud** — graph databases (Neo4j) surface "fraud rings/islands" and a **Network Risk Score**;
  fraud hides in *relationships*, not single records. One bank found tens of millions in fraud in months.
  ([Neo4j](https://neo4j.com/developer/industry-use-cases/finserv/retail-banking/ieee-cis-fraud-graphs/))
- **Social network analysis** — communities & influencers via centrality/modularity.
- **Knowledge graphs** — connect heterogeneous data for search and to ground LLMs (RAG).
- **Intelligence / ops** — link analysis, dependency/impact graphs, root-cause.

## The professional playbook (principles)
1. **Avoid the "hairball."** 100k overlapping edges "communicates nothing." Keep it to a **few hundred
   nodes**, filter to a meaningful subset first. ([Pavlopoulos 2017](https://pmc.ncbi.nlm.nih.gov/articles/PMC5540468/))
2. **Give position meaning (attribute-driven layout)** instead of a random force blob — layout by an
   attribute (time, trophic level, geography). This is a primary anti-hairball technique.
3. **Separate interaction types into layers (multilayer / multiplex networks).** A "food web" is *only*
   trophic links; mixing trophic + evolutionary + mutualistic in one blob is wrong — pros keep them as
   toggleable layers. ([multilayer ecological networks](https://besjournals.onlinelibrary.wiley.com/doi/full/10.1111/2041-210X.14225))
4. **Shneiderman's mantra:** *overview first → zoom & filter → details on demand.* ([InfoVis wiki](https://infovis-wiki.net/wiki/Visual_Information-Seeking_Mantra))
5. **Colorblind-safe palettes** (ColorBrewer is the reference).
6. **Quantify, don't just draw** — centrality (keystones), connectance, modularity (communities).

## Audit of THIS project vs. the playbook
### Already aligned ✅
- **Attribute-driven layout** — radius = time, angle = ecosystem. Exactly the recommended anti-hairball
  move (like radial phylogenies / chord diagrams), not a random blob.
- **Multilayer done right** — food web / evolution / ecology are separate toggleable layers, matching the
  multilayer-network approach. (Note: "evolution" is really a *tree*, not a web — correct to keep it apart.)
- **Shneiderman's mantra** — overview (the wheel) → filter (toggles) → details on demand (click → side card).
- **Thematic keystone** — Humans is the single most-connected node (8 prey links). Ecologically that's the
  "most-connected node whose selective removal cascades hardest" — which is *literally the story* of these
  extinctions. Strong, and defensible.

### Weak spots vs. professional food webs ⚠️
- **The trophic layer is too sparse to be a real "web."** Connectance ≈ 22 links / 32² ≈ **0.02**; real food
  webs run **~0.1–0.25**. Ours is ~5–10× thinner — mostly shallow chains (predator → 1 prey), not a web.
- **No trophic levels encoded.** Pros stack producers → herbivores → carnivores → apex (+ decomposers).
  Our layout shows time & place but not who's-above-whom in the food chain.
- **No decomposers/detritus** — every real food web has them.
- **Red↔green edge colors** (eats = red, ecology = green) are the classic **red-green colorblind clash**.
- **No metrics** — no centrality/keystone score, no connectance readout, no cascade analysis.

## Recommended upgrades (in priority order)
1. ~~**Colorblind-safe edges**~~ ✅ **DONE** — moved to the Okabe-Ito palette (vermillion / blue /
   bluish-green) **plus** redundant line styles (solid / dashed / dotted) so the three layers never rely
   on color alone. Legend updated to show both.
2. ~~**"What if it vanished?" cascade mode**~~ ✅ **DONE** — the professional **secondary-extinction /
   topological-robustness** method. In Cascade mode, click a species → it's removed, then any consumer that
   loses *all* its food dies the next round, propagating outward; the side panel reports rounds and % of the
   web lost. (e.g. remove Savanna Grass → Zebra + Quagga → Lion; 4/32 lost.)
3. ~~**Denser, level-aware trophic layer**~~ ✅ **DONE** — added a **producer base** (phytoplankton →
   zooplankton, forbs/sedges/willow, chestnut/berries, acacia, ferns & cycads…), **real multi-prey links**
   from verified diets (Smilodon → bison/camel/horse/sloth/mammoth; mammoth → forbs/grass/sedges/willow;
   pigeon → mast/berries/insects; auk → capelin/krill), and a **decomposer tier** (fungi & bacteria, dung
   beetles, vultures, marine detritivores feeding on detritus/carrion). Now **60 species, 63 trophic links,
   12 multi-prey predators**. Cascades bite properly: removing phytoplankton collapses the whole seabird
   column (plankton → capelin → auk/puffin/razorbill); removing kelp takes the sea cow, urchins *and* otter.
   - **Connectance — resolved (the earlier caveat was wrong-headed).** The whole-graph figure (~0.018) is
     *not* the right measure: this graph is **9 separate ecosystems across 66M years**, and species that
     never co-existed can't interact, so lumping them in one S² artificially deflates it. Ecologists measure
     connectance **within a single community**. Measured that way, per-ecosystem connectance averages
     **0.155 (range 0.10–0.22)** — squarely in the real range (0.1–0.25), with **zero invented links**. The
     Metrics panel now shows both, and a per-ecosystem breakdown. Lesson: match the metric's scale to the
     system, don't chase a global number that mixes incomparable communities.
4. ~~**A metrics readout**~~ ✅ **DONE** — the 📊 Metrics button shows live **connectance**, a
   **trophic-structure** breakdown (basal / intermediate / top-terminal), and two rankings: **keystones by
   collapse impact** (secondary extinctions triggered if removed) and **most-connected by degree**. Each
   row is clickable to run that species' cascade. The killer insight it surfaces: **Phytoplankton has just
   1 link but collapses 5 species**, while **Humans has 8 links but triggers 0 cascades** — proving degree ≠
   keystone importance, exactly the published finding that low-degree basal species are the true keystones.
5. ~~**Overview→detail per era/slice**~~ ✅ **DONE** — full Shneiderman "zoom & filter." Click a **ring
   label** to focus one geologic period (dims the rest, zooms in, lists its species; empty periods explain
   the Age-of-Mammals gap). Drill into an **ecosystem** from any species card ("🔍 Focus the … ecosystem")
   or the Metrics list — it isolates that one community, zooms to it, and shows its **per-community
   connectance** (the meaningful scale, e.g. North Atlantic = 0.17). "← Back" or a background click resets.
6. ~~**Weighted/motif centrality**~~ ✅ **DONE** — the Metrics panel now ranks species by **motif-weighted
   centrality**: participation in the four ecological 3-species motifs (food chain, apparent competition,
   shared-prey competition, omnivory), weighting indirect-effect motifs higher. It genuinely diverges from
   degree — e.g. the **Giant Ground Sloth (3 links) out-scores 5-link species** because it sits in dense
   omnivory/competition motifs, and equal-degree species get separated (Mammoth 44 > Pigeon 41 > Detritus
   33, all 6 links). Three keystone measures (collapse impact, degree, motif) now sit side by side for
   comparison.
7. ~~**Populate the empty periods**~~ ✅ **DONE** — the Paleogene & Neogene rings now hold real, cascading
   food webs (verified diets/dates): **Paleogene** — Titanoboa, Basilosaurus, Paraceratherium, Hyaenodon +
   forests/crocs/fish; **Neogene** — Megalodon, Terror Bird, Argentavis, Australopithecus + grasslands/
   grazers/baleen whales. **74 species** total. Bonus: an **Australopithecus → Humans** evolution spoke runs
   radially from the Neogene ring to the present rim. Both new ecosystems are drill-downable and land in the
   real connectance range.

Bottom line: the *structure* (attribute layout + multilayer toggles + details-on-demand) is already how
professionals do it. The gap is **ecological depth** (denser trophic links, trophic levels, decomposers)
and **quantification** (keystone/centrality, connectance, cascade analysis) — plus the colorblind fix.
