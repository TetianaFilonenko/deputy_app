Stack:
jruby
tabula
phoenix
elixir
postgres
node

Installation guide:
<!-- Docker in progress -->
install postgres
setup user/password = postgres/postgres
install node
install npm
install elixir
install rvm
rvm install jruby-1.7
bundle install
jruby -S gem install tabula-extractor
npm install
mix deps.get
mix ecto.create
mix ecto.migrate
mix phoenix.server


result api url: /likeliness/:deputy_id
pdf folder: /pdfs
csv folder: outputs_files
result screen http://prnt.sc/f58eoq 

# DeputyApp

To start your Phoenix app:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `npm install`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix

