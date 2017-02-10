#!/bin/bash

docker run --rm -u rstudio -ti -v $(pwd):/home/rstudio -p 4000:4000 cboettig/rcds Rscript -e "dirs = c('.', 'readings', 'assignments', 'lectures'); servr::jekyll('website', serve=$SERVE, input = dirs, output = dirs, host = '0.0.0.0', port=4000)"

