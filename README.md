# Lighthouse and Chromium

Docker image for Lighthouse and Chromium to use as CI container.

Image on DockerHub: https://hub.docker.com/r/trion/chromium-lighthouse/

Currently this image uses Node LTS (node:lts-alpine as base) distribution.

# Usage Examples

Run lighthouse

```
docker run --rm -u $(id -u) -v $(pwd):/app trion/chromium-lighthouse lighthouse https://www.google.de  --chrome-flags="--headless --no-sandbox"
```

Run lhci

```
docker run --rm trion/chromium-lighthouse lhci --collect.url="https://www.google.de"  --collect.settings.chromeFlags="--headless --no-sandbox" --upload.target=temporary-public-storage autorun
```

Run lhci locally with output to filesystem

```
docker run --rm -u $(id -u) -v $(pwd):/app trion/chromium-lighthouse lhci \
--collect.staticDistDir="/app/dist" --collect.isSinglePageApplication=true \
--collect.settings.chromeFlags="--headless --no-sandbox" \
--upload.target=filesystem --upload.outputDir=/app/lighthouse/report autorun
```

## ARM64 / mac M1
This image is provided as ARM64 (v8) linux image.
It runs on 64bit ARM like hardkernel ODROID or Raspberry Pi.

If you had success running it on mac M1, please open a feedback issue