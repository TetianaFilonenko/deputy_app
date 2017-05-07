
## Stack:
* jruby
* tabula
* phoenix
* elixir
* postgres
* nodejs

## Installation guide:
<!-- Docker in progress -->
<!-- Docker version 17.03.1-ce, build c6d412e -->
the most updated version
https://github.com/TetianaFilonenko/deputy_app


* install postgres
* setup user/password = postgres/postgres
* install node
* install npm
* install elixir
* install rvm
* rvm install jruby-1.7
* bundle install
* jruby -S gem install tabula-extractor
* npm install
* mix deps.get
* mix ecto.create
* mix ecto.migrate
* mix custom_phoenix.pdf_generation - rake task, extract pdfs to csv
* mix custom_phoenix.import_data - load to db from csv
* mix phoenix.server

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

all deputy page: /deputies
result api url: /likeliness/:deputy_id
pdf folder: /pdfs
csv folder: outputs_files
result screen http://prnt.sc/f58eoq 
