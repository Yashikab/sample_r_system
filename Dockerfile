# r-base
FROM r-base:4.4.1 AS base
RUN apt-get update \
    && apt-get install -y --no-install-recommends libxml2-dev \
    && rm -rf /var/lib/apt/lists/*

RUN R -e "install.packages('renv')"


RUN mkdir -p /renv
COPY ./renv /renv
COPY ./renv.lock renv.lock
RUN R -e "renv::restore()"


FROM base AS ci

RUN mkdir -p /app
WORKDIR /app
COPY --from=base /renv /app/renv
COPY --from=base /renv.lock /app/renv.lock
ENV RENV_PATHS_CACHE=renv/.cache

COPY hack /app/hack
COPY Makefile /app/Makefile

RUN R -e "renv::repair()"

ENTRYPOINT [ "make" ]
