defmodule Mix.Tasks.List.Github.Repos do
  use Mix.Task

  @shortdoc "Show github repos list"

  def run(args) do
    url = "users/" <> Application.get_env(:synchub, :userid) <> "/repos"
    Synchub.start
    Synchub.get(url)
  end
end
