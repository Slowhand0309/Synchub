defmodule Mix.Tasks.Sync.Github do
  use Mix.Task

  @shortdoc "Sync github repos"

  alias Synchub.Syncrepos

  def run(args) do
    IO.puts "start sync github repos..."
    unless Syncrepos.install_git? do
      IO.puts "not found git. please install"
    else
      url = "users/" <> Application.get_env(:synchub, :userid) <> "/repos"
      Synchub.start
      repos = Synchub.get(url)
      Syncrepos.sync(repos.body)
      IO.puts "success sync github repos"
    end
  end
end
