defmodule Synchub.Listrepos do

@moduledoc """
The module of list github repos.
"""

@doc "put repos name."
def put_repo_name([info|tail]) do
  IO.puts info["name"]
  put_repo_name(tail)
end

def put_repo_name(info) do
end

end
