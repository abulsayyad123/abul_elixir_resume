defmodule AbulasarResumeWeb.BlogPosts.BlogTest do
  use ExUnit.Case
  alias AbulasarResumeWeb.BlogPosts.Blog
  import Mox

  setup :verify_on_exit!
  setup :set_mox_global

  test "fetch blogs" do
    Test.NeuronMock
    |> expect(:query, fn _query -> response() end)

    assert Blog.get_blogs(0) == []
  end

  defp response() do
    {:ok,
      %Neuron.Response{
        body: %{
          "data" => %{
            "user" => %{
              "publication" => %{
                "posts" => []

              }
            }
          }
        }
      }
    }
  end
end
