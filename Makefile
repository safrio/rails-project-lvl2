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

.PHONY: test
