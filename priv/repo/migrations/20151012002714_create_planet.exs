defmodule TddDeathStar.Repo.Migrations.CreatePlanet do
  use Ecto.Migration

  def change do
    create table(:planets) do
      add :x, :integer
      add :y, :integer
      add :z, :integer
      add :description, :text
      add :name, :string
      add :destroyed, :boolean, default: false

      timestamps
    end

  end
end
