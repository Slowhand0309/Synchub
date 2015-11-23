defmodule Synchub.Syncrepos do

@moduledoc """
The module of sync github repos.
"""

@rootpath Application.get_env(:synchub, :rootpath)

@doc "check install git client"
def install_git?() do
  ret = System.find_executable("git")
  ret != nil
end

@doc "sync github repos."
def sync([info|tail]) do
  # create sync repos dir
  unless File.exists?(@rootpath) do
    IO.puts "create dir ==> " <> @rootpath
    File.mkdir(@rootpath)
  end

  # check sync repo dir
  unless File.exists?(@rootpath) do
    IO.puts "create dir " <> @rootpath <> " failed !!"
    false
  else
    File.cd(@rootpath)

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
end

def sync([]), do: true

end
