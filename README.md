[![CircleCI](https://circleci.com/gh/ds421/rcds.svg?style=svg)](https://circleci.com/gh/ds421/rcds "Status of automated website build, including running R code")


# rcds: Reproducible and Collaborative Data Science


## Organization

- `website/` contains the website source files
- `docs/` contains automatically generated files from `website/` using knitr/jekyll. Hosted on GitHub's GH-Pages service, <https://ds421.github.io/rcds>

- `Dockerfile` Docker recipe to generate a containerized environment for building the website and all R exercises
- `circle.yml` Configuration file for the Continuous Integration service <https://circle-ci.com>, which builds and deploys the site on each commit. 
- `circle-github.deploy.sh` a convenient script to help Circle deploy the website to GitHub.


## Building and deploying site: 


The simplest way to build locally is to install Docker and run: 

Build & view site on localhost:

```bash
# docker run -d -p 4000:4000 -v $(pwd):/home/rstudio cboettig/rcds
```

Build site into docs/

```
docker run -ti -v $(pwd):/home/rstudio -e SERVE=FALSE cboettig/rcds
```



