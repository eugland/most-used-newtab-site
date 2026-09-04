# CLAUDE.md — apps (landing pages & privacy policies)

This repo is the **public website** (GitHub Pages) for eugland's Chrome
extensions. It hosts each extension's landing page and **privacy policy** only —
extension source code lives elsewhere.

Live: https://eugland.github.io/apps/

## Layout
- `index.html` — hub linking each app
- `new-tab/` — New Tab: More Recent Visited (landing + privacy)
- `wechat/` — WeChat Image Downloader (landing + privacy)

## Source repos (the actual extension code)
- New Tab: https://github.com/eugland/most-used-newtab
- WeChat Image Downloader: `wx-image-downloader`

## Important
- The **privacy policy** each extension submits to the Chrome Web Store points
  at a URL in this repo (e.g. `https://eugland.github.io/apps/wechat/privacy.html`).
  Do not move or rename these paths without updating the Store listing.
- When an extension changes its permissions or data handling, update the
  matching `*/privacy.html` and `*/index.html` here.
