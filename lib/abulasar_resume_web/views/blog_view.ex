defmodule AbulasarResumeWeb.BlogView do
  use AbulasarResumeWeb, :view

  def cover_image(blog) do
    blog["coverImage"]
  end

  def to_date(datetime) do
    {:ok, date, _} = DateTime.from_iso8601(datetime)
    Calendar.strftime(date, "%y-%m-%d")
  end
end
