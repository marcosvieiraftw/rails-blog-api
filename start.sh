#!/bin/sh
echo "Bundle check..."
bundle check || bundle install

echo "Initializing database..."
# Por enquanto deixarei com o setup para nao precisar rodar migrate nem seed.
bundle exec rails db:setup
# bundle exec rake db:create

echo "Migrating & seeding..."
# bundle exec rails db:migrate
# bundle exec rails db:seed

rm tmp/* -Rf

bundle exec rails s