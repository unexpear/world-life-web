# World Life Web

Interactive web of life. Explore animals as nodes and the connections between them — who eats whom (food webs), who descends from whom (evolution), who depends on whom (symbiosis).

An interactive graph you can pan, zoom, click, and follow threads through.

**Live site:** https://unexpear.github.io/world-life-web/ · or open [index.html](index.html) locally.

## Docs
- [concept.md](concept.md) — the core pitch + the strata (deep-time) layout
- [data-model.md](data-model.md) — how species and connections are stored
- [build.md](build.md) — crawl → walk → run tech path
- [fact-check.md](fact-check.md) — sources + corrections to the species claims
- [professional-practice.md](professional-practice.md) — how webs are used professionally + audit of this project
- [CREDITS.md](CREDITS.md) — full citations & data-source credits
- [holes.md](holes.md) — open questions

## Publishing changes
Edit `index.html`, then run the one-liner to commit + push (GitHub Pages rebuilds in ~1 min):

```powershell
.\publish.ps1 "what you changed"     # PowerShell
```
```bash
./publish.sh "what you changed"      # Git Bash / macOS / Linux
```

## One-liner
"Wikipedia meets a living food-web map — click any animal, see everything it's connected to."
