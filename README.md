# Lighthouse and Chromium

Docker image for Lighthouse and Chromium to use as CI container.

Image on DockerHub: https://hub.docker.com/r/trion/chromium-lighthouse/

Currently this image uses Node LTS (node:lts-alpine as base) distribution.

# Usage

Examples:

```
docker run --rm -u $(id -u) -v $(pwd):/app trion/chromium-lighthouse lighthouse https://www.google.de  --chrome-flags="--headless --no-sandbox"
```

```
docker run --rm lhci --collect.url="http://www.bom.gov.au/tas/forecasts/hobart.shtml"  --collect.settings.chromeFlags="--headless --no-sandbox" --upload.target=temporary-public-storage autorun
```

## ARM64 / mac M1
This image is provided as ARM64 (v8) linux image.
It runs on 64bit ARM like hardkernel ODROID or Raspberry Pi.

If you had success running it on mac M1, please open a feedback issue