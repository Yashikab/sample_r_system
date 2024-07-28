# r-base
FROM r-base:4.4.1

RUN R -e "install.packages('renv')"

RUN mkdir /app
WORKDIR /app

COPY . .
RUN R -e "renv::restore()"
