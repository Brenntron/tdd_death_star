defmodule Forge do
  use Blacksmith
  alias TddDeathStar.Planet

  @save_one_function &Blacksmith.Config.save/2
  @save_all_function &Blacksmith.Config.save_all/2

  register :planet,
    __struct__: Planet,
    name: Faker.Name.name,
    description: Faker.Lorem.paragraph,
    x: 872,
    y: 527,
    z: 42
end
