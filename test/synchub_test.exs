defmodule SynchubTest do
  use ExUnit.Case

  test "user-agent" do
    headers = Synchub.process_request_headers(%{})
    agent = Map.fetch!(headers, :"User-Agent")
    assert agent == Application.get_env(:synchub, :username)
  end

  test "list.github.repos" do
    url = "users/" <> Application.get_env(:synchub, :userid) <> "/repos"
    Synchub.start
    assert_response Synchub.get(url)
  end

  defp assert_response(response) do
    assert HTTPotion.Response.success?(response, :extra)
  end

end
