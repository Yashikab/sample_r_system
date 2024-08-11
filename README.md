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

You must install renv in your local R package.
You can run bellow command any directory on your local.

```bash
# running R
R
# install renv
> install.packages("renv")
```

## How to develop

### Directory

Your scripts should be in `src` directory.
Deployed docker image will only used `src` directory.
In addition, lint and test will not track your changes outside of `src` directory.

### Lint

You can run bellow command any directory on your local.
Continuous integration also runs linting.

```bash
# on the repository root
make lint
```

If the linting failed, you can fix it with following command.

```bash
# on the repository root
make fmt
```

### Test

You can run bellow command any directory on your local.
Continuous integration also runs test.

```bash
# on the repository root
make test
```

### Synchronize renv status

When you add new libraries, you need to snapshot for renv.
If you forgot snapshotting, continuous integretion will failed when you push to github.

You can sync renv state via following make command.

```bash
# on the repository root
make sync_R
```

Also, you can check status whether your renv is sync to your scripts state via following:

```bash
# on the repository root
make check_R
```

## CI

We use github actions for continuous integrations.
We will check following:

- renv status
- lint
- test

There are two types of checking.

1. check on docker container (see `.github/workflows/check_with_docker.yml`)
2. install R to github actions runner & check on it. (see `.github/workflows/check_with_runner.yml`)

You can choose once depends on your situation when you construct systems.

## Deployment

When all ci checks passed, github actions will deploy your scripts as docker image.
At that time, scripts must be in `src` directory.
