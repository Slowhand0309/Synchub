defmodule Synchub do
  @moduledoc """
  The module of sync github repos.
  """
  use HTTPotion.Base

  @apiurl Application.get_env(:synchub, :apiurl)

  @doc "handle create url."
  def process_url(url) do
    IO.puts @apiurl <> url
    @apiurl <> url
  end

  @doc "handle create request header."
  def process_request_headers(headers) do
    Dict.put headers, :"User-Agent", Application.get_env(:synchub, :username)
  end

  @doc "handle response of html body."
  def process_response_body(body) do
    body |> Poison.decode!
  end
end
