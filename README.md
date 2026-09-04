# apps — landing pages & privacy policies

Public website (GitHub Pages) hosting the landing page and privacy policy for
each of eugland's Chrome extensions. Extension **source code lives in separate
repos** — this repo only hosts static pages.

Live: https://eugland.github.io/apps/

## Structure

```
index.html          Landing hub linking to each app
new-tab/            New Tab: More Recent Visited
  index.html          landing page
  privacy.html        privacy policy
  images/ audio/ scripts/
wechat/             WeChat Image Downloader
  index.html          landing page
  privacy.html        privacy policy
  images/
```

## Apps & their source repos

| App | Landing / Privacy (here) | Source repo |
|-----|--------------------------|-------------|
| New Tab: More Recent Visited | `new-tab/` | https://github.com/eugland/most-used-newtab |
| WeChat Image Downloader | `wechat/` | (extension source: `wx-image-downloader`) |

## Keeping docs in sync

The landing page and **privacy policy of each extension live in THIS repo**.
When an extension's behavior, permissions, or data handling changes in its
source repo, update the matching `*/privacy.html` and `*/index.html` here too.
Each source repo's README/CLAUDE.md points back here as a reminder.
