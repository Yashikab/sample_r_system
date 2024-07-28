# sample_r_system

R system sample

## R version

see [.R_version](./.R_version)

## Required packages for managing packages

You need to install `renv` for managing other packages which is used for R execution.

### Install specific R version

You have to install fixed R version as same as `.R_version` file statement.
If you have not installed R yet or installed different version of R, you have to install additionally for specified R version in `.R_version` file.
The way of istall R is depends on OS, so see [here](https://cloud.r-project.org/) to install.

### Install `renv`

```bash
# running R
R
# install renv
> install.packages("renv")
```
