Semantic Version Tools
======================

## Description

A git-aware semantic versioning tool built in golang, which includes a
re-usable GitHub Action. This thing is intended to automate more so
I can tag less and drink more coffee.

## Status

[![Go Tests](https://github.com/sam-caldwell/semver/actions/workflows/go-tests.yaml/badge.svg)](https://github.com/sam-caldwell/simpleSet/actions/workflows/go-tests.yaml)

## Usage

### Installation

### In your go project?

`go get "github.com/sam-caldwell/semver/v2"`

### As a command

1. Clone the repo
2. Execute `make build && make install`

### Commands and Usages

```
bumpVersion [-major] [-minor] [-patch] [-updateTag]

-The tool will query the local (.) git repo for the most recent tag

-If there are no tags on the local repo at (.), v0.0.0 is assumed
 as the starting value.

  -major
        Bump major version
  -minor
        Bump minor version
  -patch
        Bump patch version
  -updateTag
        Update the git tag
  -v    verbose output
  -verbose
        verbose output
```



### Tests

`make test`
