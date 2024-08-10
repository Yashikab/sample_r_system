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

ENV WORKSPACE=ci_workspace
RUN mkdir -p /${WORKSPACE}


COPY --from=base /renv /${WORKSPACE}/renv
COPY --from=base /renv.lock /${WORKSPACE}/renv.lock
ENV RENV_PATHS_CACHE=/${WORKSPACE}/renv/.cache

COPY hack /${WORKSPACE}/hack
COPY Makefile /${WORKSPACE}/Makefile

WORKDIR ${WORKSPACE}
RUN R -e "renv::repair()"

ENTRYPOINT [ "make" ]
