FROM rocker/verse:3.3.1

RUN apt-get update && apt-get -y install --no-install-recommends jekyll ruby-rouge

WORKDIR /home/rstudio
USER rstudio
EXPOSE 4000

CMD Rscript -e "dirs = list.dirs(recursive=FALSE, full.names=FALSE); servr::jekyll('website', serve=FALSE, input = dirs, output = dirs)"

 
