# MarcoTroisi.com

Personal site for Marco Troisi: founder, fractional CTO and software architect.

Built with [Hugo](https://gohugo.io/), using the local `mt2016` theme. The look and feel is
deliberately unchanged: Merriweather body text, GT Walsheim headings, Apercu Mono metadata.

## Requirements

- Hugo **0.169.0** (standard, non-extended build)
- `rsync` for publishing

Hugo is pinned in `.github/workflows/main.yml` and `build.sh`.

## Local development

```bash
hugo server
```

Then open <http://localhost:1313/>.

## Build

```bash
./build.sh
```

Output goes to `public/`. The script also copies `index.xml` to `feed/index.xml` so the
historical RSS path keeps working.

## Publish

```bash
./deploy.sh
```

This builds the site, syncs `public/` into `docs/` (deleting stale files), and pushes.
GitHub Pages serves the `docs/` folder on `master`.

The same build runs in GitHub Actions on every push to `master`.

## Structure

```
content/
  _index.md          homepage metadata
  work/              O2A Labs / working with Marco
  writing/           The Serverless Mindset
  talks/             speaking history
  about/
  contact/
  archive/           historical article index
  post/              historical articles (explicit root URLs — do not change)
  images/            legacy article images (moved to static/images)
data/
  home.yaml          homepage section order and copy
themes/mt2016/       templates and styles
```

## Notes

- Historical posts keep their original root-level URLs via `url:` front matter. Do not
  introduce a new permalink pattern.
- Legacy images live in `static/images/` and `static/wp-content/` so existing URLs keep working.
- The draft `how-to-cope-in-bad-job` is intentionally unpublished; a `noindex` placeholder
  keeps the old URL from returning a hard 404.
