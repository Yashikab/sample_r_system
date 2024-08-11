# r-base
FROM r-base:4.4.1 AS base
RUN apt-get update \
    && apt-get install -y --no-install-recommends libxml2-dev \
    && rm -rf /var/lib/apt/lists/*

RUN R -e "install.packages('renv')"

RUN mkdir -p /basedir
WORKDIR /basedir
RUN mkdir -p renv
COPY renv.lock renv.lock
COPY .Rprofile .Rprofile
COPY renv/activate.R renv/activate.R
COPY renv/settings.json renv/settings.json

RUN mkdir renv/.cache
ENV RENV_PATHS_CACHE=renv/.cache
RUN R -e "renv::restore()"


FROM base AS ci

ENV WORKSPACE=/__w/sample_r_system/sample_r_system
RUN mkdir -p /${WORKSPACE}
WORKDIR /${WORKSPACE}

COPY --from=base /basedir .

COPY hack /${WORKSPACE}/hack
COPY Makefile /${WORKSPACE}/Makefile

ENTRYPOINT [ "make" ]
