# r-base
FROM r-base:4.4.1
RUN apt-get update \
    && apt-get install -y --no-install-recommends libxml2-dev \
    && rm -rf /var/lib/apt/lists/*

RUN R -e "install.packages('renv')"

RUN mkdir /app
WORKDIR /app

COPY . .
RUN R -e "renv::restore()"
