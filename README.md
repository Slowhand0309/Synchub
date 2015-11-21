# Synchub
 Tool to synchronize the whole repository of GitHub

[![Build Status](https://travis-ci.org/Slowhand0309/Synchub.svg?branch=master)](https://travis-ci.org/Slowhand0309/Synchub)

## Description

It will synchronize all of the repository GitHub<br />
If there is no repository is locally was cloned, if it exists, run the specific command

## Setup
You need to set the `dev.exs` at the beginning

```elixir
use Mix.Config

config :synchub,
  apiurl: "https://api.github.com/",
  userid: "Slowhand0309", # github account id
  username: "Slowhand", # github account user name
  exists_cmd: ["pull", "origin"] # see below
```
`exists_cmd:` =>
Git commands you already run against the repository have been cloned

compile
```
$ mix compile
```

## Usage
It has the following mix task

* Show the GitHub repository list

```
$ mix list.github
```

* Synchronization of github repository

```
$ mix sync.github
```

## Licence

[MIT](https://github.com/tcnksm/tool/blob/master/LICENCE)

## Author

[slowhand0309](https://github.com/Slowhand0309)
