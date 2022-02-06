setup:
	bin/setup

start:
	bin/rails s -p 3000 -b "0.0.0.0"

test:
	bundle exec rails test

lint: lint-code

lint-code:
	bundle exec rubocop
	bundle exec slim-lint app/views/

ci-setup:
	yarn install
	bundle install --without production development
	RAILS_ENV=test bin/rails db:prepare db:migrate assets:precompile

.PHONY: test
