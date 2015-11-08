defmodule Synchub do
  @moduledoc """
  The module of sync github repos.
  """
  use HTTPotion.Base

  @apiurl Application.get_env(:synchub, :apiurl)

  @doc "handle create url."
  def process_url(url) do
    @apiurl <> url
  end

  @doc "handle create request header." 
  def process_request_headers(headers) do
    Dict.put headers, :"User-Agent", Application.get_env(:synchub, :username)
  end

  @doc "handle response of html body."
  def process_response_body(body) do
    body |> Poison.decode! |> put_repo_name
  end

  @doc "put repos name."
  def put_repo_name([info|tail]) do
    IO.puts info["name"]
    put_repo_name(tail)
  end

  def put_repo_name([]), do: nil
end
