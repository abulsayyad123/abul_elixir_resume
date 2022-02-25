defmodule  AbulasarResumeWeb.Blog do
  @username "abulasar"
  def get_blogs(page \\0) do
    Neuron.query("""
      {
        user(username: "#{@username}") {
            publication {
                posts(page: #{page}) {
                    title
                    brief
                    slug
                    cuid
                    coverImage
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
            title,
            slug,
            cuid,
            coverImage,
            content,
            contentMarkdown,
            tags {
            name
            }
        }
        }
    """)
  end
end
