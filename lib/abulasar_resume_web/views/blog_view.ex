defmodule AbulasarResumeWeb.BlogView do
  use AbulasarResumeWeb, :view

  def cover_image(blog) do
    blog["coverImage"]
  end

  def to_date(datetime) do
    date_iso8601(datetime)
    |> Calendar.strftime("%y-%m-%d")
  end

  def blog_main_date(datetime) do
    day = date_iso8601(datetime) |> Calendar.strftime("%d")
    month = date_iso8601(datetime) |> Calendar.strftime("%b")
    '<span class="day">#{day}</span><span class="month">#{month}</span>'
  end

  defp date_iso8601(datetime) do
    {:ok, date, _} = DateTime.from_iso8601(datetime)
    date
  end
end
