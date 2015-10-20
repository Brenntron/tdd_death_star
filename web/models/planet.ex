defmodule TddDeathStar.Planet do
  use TddDeathStar.Web, :model

  schema "planets" do
    field :x, :integer
    field :y, :integer
    field :z, :integer
    field :description, :string
    field :name, :string
    field :destroyed, :boolean, default: false

    timestamps
  end

  @required_fields ~w(name x y z destroyed)
  @optional_fields ~w(description)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> validate_number(:x, greater_than: 0, less_than: 1000)
    |> validate_number(:y, greater_than: 0, less_than: 1000)
    |> validate_number(:z, greater_than: 0, less_than: 1000)
    |> validate_length(:description, min: 2)
  end
end
