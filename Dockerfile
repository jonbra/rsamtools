FROM rocker/tidyverse:4.2.1

LABEL org.opencontainers.image.authors="jon.brate@fhi.no"

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get -y upgrade && \
    apt-get install -y libz-dev libbz2-dev liblzma-dev libcurl4-openssl-dev

# Install R packages
RUN Rscript -e "install.packages('BiocManager')"
RUN R -e 'BiocManager::install(c("Rsamtools", ask = F))'
RUN R -e "install.packages('lubridate')"
RUN R -e "install.packages('phylotools')"
