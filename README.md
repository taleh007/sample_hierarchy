# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

### Ruby version

2.6.*

### System dependencies

Sqlite3

### Setup

```bash
bundle install

yarn install --check-files

bundle exec rake db:create db:migrate db:seed

bundle exec rails s
```

### Tests

```bash

bundle exec rspec spec
```
