use Mix.Config

config :synchub,
  apiurl: "https://api.github.com/",
  userid: "Slowhand0309",
  username: "Slowhand",
  rootpath: "/home/vagrant/syncrepos",
  exists_cmd: ["pull", "origin"]
