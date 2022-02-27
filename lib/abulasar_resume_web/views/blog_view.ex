defmodule AbulasarResumeWeb.BlogView do
  use AbulasarResumeWeb, :view

  def cover_image(blog) do
    blog["coverImage"]
  end
end
