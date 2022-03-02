defmodule AbulasarResume.Repo.Migrations.AddExperiencesTable do
  use Ecto.Migration

  def change do
    create table(:experiences) do
      add :organization_name, :string, null: false
      add :title, :string, null: false
      add :job_description, :text
      add :start_date, :date
      add :end_date, :date
      add :current_working, :boolean, default: false

      timestamps()
    end

    create index(:experiences, [:organization_name, :title])
  end
end
