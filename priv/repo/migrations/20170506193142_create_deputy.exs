defmodule DeputyApp.Repo.Migrations.CreateDeputy do
  use Ecto.Migration

  def change do
    create table(:deputies) do
      add :name, :string

      timestamps()
    end

  end
end
