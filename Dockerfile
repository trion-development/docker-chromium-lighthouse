#docker build -t lhci .

# usage:
#
# lighthouse http://www.bom.gov.au/tas/forecasts/hobart.shtml  \
#   --chrome-flags="--headless --no-sandbox"

# lhci --collect.url="http://www.bom.gov.au/tas/forecasts/hobart.shtml"  \
#   --collect.settings.chromeFlags="--headless --no-sandbox" \ 
#   --upload.target=temporary-public-storage autorun

FROM alpine:3

LABEL maintainer="trion development GmbH <info@trion.de>"

ARG USER_HOME_DIR="/tmp"
ARG APP_DIR="/app"
ARG USER_ID=1000

#reduce logging
ENV NPM_CONFIG_LOGLEVEL=warn CI=true NO_UPDATE_NOTIFIER=true
ENV HOME "$USER_HOME_DIR"

#not declared to avoid anonymous volume leak
#but when not manually bound to host fs, performance will suffer!
#VOLUME "$USER_HOME_DIR/.cache/yarn"
#VOLUME "$APP_DIR/"
WORKDIR $APP_DIR
EXPOSE 4200

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

RUN mkdir -p ${APP_DIR} && chown 1000 ${APP_DIR} && chmod a+w ${APP_DIR} \
  && mkdir -p /tmp/.config && chmod a+w /tmp/.config
RUN apk --no-cache upgrade && apk add --no-cache nodejs npm chromium dumb-init
RUN npm install -g lighthouse @lhci/cli @lhci/server

USER $USER_ID
