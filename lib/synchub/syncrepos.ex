defmodule Synchub.Syncrepos do

@moduledoc """
The module of sync github repos.
"""

@rootdir "syncrepos"

@doc "check install git client"
def install_git?() do
  ret = System.find_executable("git")
  ret != nil
end

@doc "sync github repos."
def sync([info|tail]) do
  # create sync repos dir
  unless File.exists?(@rootdir) do
    IO.puts "create dir ==> " <> @rootdir
    File.mkdir(@rootdir)
  end
  File.cd(@rootdir)

  if File.exists?(info["name"]) do
    # git command
    File.cd(info["name"])
    IO.puts "exists repo dir " <> info["name"]
    case System.cmd("git", Application.get_env(:synchub, :exists_cmd)) do
      {err, code} -> IO.puts(err)
    end
    File.cd("../")
  else
    # clone repo
    clone_url = info["clone_url"]
    if clone_url do
      IO.puts "clone " <> clone_url
      case System.cmd("git", ["clone", clone_url]) do
        {err, code} -> IO.puts(err)
      end
    end
  end
  File.cd("../")
  sync(tail)
end

def sync([]), do: nil

end
