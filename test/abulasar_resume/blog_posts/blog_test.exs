defmodule AbulasarResumeWeb.BlogPosts.BlogTest do
  use ExUnit.Case
  alias AbulasarResumeWeb.BlogPosts.Blog
  import Mox

  setup :verify_on_exit!
  setup :set_mox_global

  describe "Blog.get_blogs/1" do
    test "fetches all blogs of zero page number if no page is passed" do
      Test.NeuronMock
      |> expect(:query, fn _query -> response() end)

      assert Blog.get_blogs() == [
        %{
          "brief" => "First Blog",
          "coverImage" => "https://cdn.hashnode.com/res/hashnode/image/upload/v1636182708121/JC8KpAKao.png",
          "cuid" => "ckvngzj8v00emj3s1dm36ca6r",
          "dateAdded" => "2021-11-06T07:13:07.873Z",
          "slug" => "building-realtime-liveview-app-using-phoenix-pubsub",
          "title" => "Building Realtime LiveView App using Phoenix PubSub",
          "type" => "story"
        }
      ]
    end

    test "fetches empty list after last page" do
      Test.NeuronMock
      |> expect(:query, fn _query -> empty_response() end)

      assert Blog.get_blogs(3) == []
    end
  end

  describe "Blog.get_detail_blog/1" do
    test "returns blog detail on passing correct slug" do
      Test.NeuronMock
      |> expect(:query, fn _query -> detail_response() end)

      assert Blog.get_detail_blog("first_blog") == %{
        "content" => "First body",
        "coverImage" => "https://cdn.hashnode.com/res/hashnode/image/upload/v1630603701244/e8Lp1Rqs5.png",
        "cuid" => "ckt37g7sb01fftcs1hpbq2s47",
        "dateAdded" => "2021-09-02T17:31:21.936Z",
        "slug" => "improving-nodejs-performance-with-clustering",
        "tags" => [%{"name" => "Node.js"}, %{"name" => "scaling"}],
        "title" => "Improving NodeJS Performance with Clustering"
      }
    end

    test "returns nil on passing wrong slug" do
      Test.NeuronMock
      |> expect(:query, fn _query -> error_response() end)

      assert Blog.get_detail_blog("wrong_slug") == nil
    end
  end

  defp response() do
    {:ok,
      %Neuron.Response{
        body: %{
          "data" => %{
            "user" => %{
              "publication" => %{
                "posts" => [
                  %{
                    "brief" => "First Blog",
                    "coverImage" => "https://cdn.hashnode.com/res/hashnode/image/upload/v1636182708121/JC8KpAKao.png",
                    "cuid" => "ckvngzj8v00emj3s1dm36ca6r",
                    "dateAdded" => "2021-11-06T07:13:07.873Z",
                    "slug" => "building-realtime-liveview-app-using-phoenix-pubsub",
                    "title" => "Building Realtime LiveView App using Phoenix PubSub",
                    "type" => "story"
                  }
                ]

              }
            }
          }
        }
      }
    }
  end

  defp empty_response() do
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

  defp error_response() do
    {:ok,
      %Neuron.Response{
        body: %{
          "data" => %{"post" => nil}
        }
      }
    }
  end

  defp detail_response() do
    {:ok,
      %Neuron.Response{
        body: %{
          "data" => %{
            "post" => %{
              "content" => "First body",
              "coverImage" => "https://cdn.hashnode.com/res/hashnode/image/upload/v1630603701244/e8Lp1Rqs5.png",
              "cuid" => "ckt37g7sb01fftcs1hpbq2s47",
              "dateAdded" => "2021-09-02T17:31:21.936Z",
              "slug" => "improving-nodejs-performance-with-clustering",
              "tags" => [%{"name" => "Node.js"}, %{"name" => "scaling"}],
              "title" => "Improving NodeJS Performance with Clustering"
            }
          }
        }
      }
    }
  end
end
