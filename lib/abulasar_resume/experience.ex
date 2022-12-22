defmodule AbulasarResume.Experience do
  use Ecto.Schema
  import Ecto.Changeset
  alias AbulasarResume.Experience

  schema "experiences" do
    # field :organization_name, :string, null: false
    # field :title, :string, null: false
    field :job_description, :string
    field :start_date, :date
    field :end_date, :date
    field :current_working, :boolean, default: false

    timestamps()
  end

  def changeset(%Experience{} = experience, attrs) do
    experience
    |> cast(attrs, [:organization_name, :title, :job_description, :start_date, :start_date, :current_working])
    |> validate_required([:organization_name, :title])
  end

end
