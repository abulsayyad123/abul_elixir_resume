defmodule  AbulasarResumeWeb.Blog do
  @username "abulasar"
  def get_blogs(page \\0) do
    Neuron.query("""
      {
        user(username: "#{@username}") {
          publication {
            posts(page: #{page}) {
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
  end

  def get_detail_blog(slug) do
    Neuron.query("""
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
  end
end
