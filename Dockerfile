FROM odoo:17.0

# Update all packages to fix vulnerabilities
USER root
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get dist-upgrade -y && \
    apt-get autoremove -y && \
    USER root

RUN apt-get -y update && apt-get install -y --no-install-recommends locales netcat-openbsd \
    && locale-gen ${LOCALE} \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ENV LANGUAGE=${LOCALE}
ENV LC_ALL=${LOCALE}
ENV LANG=${LOCALE}

USER 0

RUN apt-get -y update && apt-get install -y --no-install-recommends locales netcat-openbsd \
    && locale-gen ${LOCALE}

WORKDIR /app

COPY --chmod=755 entrypoint.sh ./

HEALTHCHECK NONE

ENTRYPOINT ["/bin/sh"]

CMD ["entrypoint.sh"]