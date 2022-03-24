defmodule  AbulasarResumeWeb.BlogPosts.Blog do
  @username "abulasar"
  def get_blogs(page_no \\0) do
    page_key = "page_#{page_no}"
    { _, blogs } = Cachex.fetch(:hasnode_blogs, page_key, fn(_page_key) ->
      with { :ok, fetched_blogs } <- page_no |> blogs_query |> Neuron.query do
        { :commit, get_in(fetched_blogs.body, ["data", "user", "publication", "posts"]) }
      end
    end)
    blogs
  end

  def get_detail_blog(slug) do
    { _, blog } = Cachex.fetch(:hasnode_blogs, slug, fn(slug) ->
      with {:ok, fetched_blog} <-  slug |> detail_blog_query |> Neuron.query do
        {:commit, get_in(fetched_blog.body, ["data", "post"])}
      end
    end)
    blog
  end

  # Private

  defp blogs_query(page_no) do
    """
      {
        user(username: "#{@username}") {
          publication {
            posts(page: #{page_no}) {
              brief
              coverImage
              cuid
              dateAdded
              slug
              title
              type
            }
          }
        }
      }
    """
  end

  defp detail_blog_query(slug) do
    """
      {
        post(slug: "#{slug}", hostname: "#{@username}") {
          content,
          contentMarkdown,
          coverImage,
          cuid,
          dateAdded,
          slug,
          title,
          tags {
            name
          }
        }
      }
    """
  end
end
