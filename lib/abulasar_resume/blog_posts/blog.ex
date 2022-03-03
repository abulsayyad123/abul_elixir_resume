defmodule  AbulasarResumeWeb.Blog do
  @username "abulasar"
  def get_blogs(page_no \\0) do
    page_key = "page_#{page_no}"
    { _, blogs } = Cachex.fetch(:hasnode_blogs, page_key, fn(_page_key) ->
      { :ok, fetched_blogs } = Neuron.query("""
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
              }
            }
          }
        }
      """)
      { :commit, get_in(fetched_blogs.body, ["data", "user", "publication", "posts"]) }
    end)
    blogs
  end

  def get_detail_blog(slug) do
    { _, blog } = Cachex.fetch(:hasnode_blogs, slug, fn(slug) ->
      {:ok, fetched_blog} =  Neuron.query("""
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
      """)
      {:commit, get_in(fetched_blog.body, ["data", "post"])}
    end)
    blog
  end
end
