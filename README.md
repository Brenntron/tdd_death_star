# TddDeathStar

To start your Phoenix app:

  1. Install dependencies with `mix deps.get`
  2. Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  3. Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Specifications

###Planets

Planets are on x, y, and z axes, and have descriptions.

Once you add a planet it is added to the Death Star's target list. From
the list you can choose to blow up planets or remove them from the
list.

###Planet List

A list of targeted planets that gives the option to destroy a planet or
simply remove it from the list.

Also, there will be a destroyed planet list. A kind of macabre
scoreboard.


## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: http://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
