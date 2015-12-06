defmodule Mix.Tasks.List.Github do
  use Mix.Task

  @shortdoc "Show github repos list"

  def run(args) do
    url = "users/" <> Application.get_env(:synchub, :userid) <> "/repos"
    Synchub.start
    repos = Synchub.get(url)
    Synchub.Listrepos.put_repo_name(repos.body)
  end
end
