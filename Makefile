.PHONY: build up test

build: Dockerfile requirements.in
	rm -f .build-success
	docker-compose build web
	touch .build-success

up: .build-success
	docker-compose up -d

test: .build-success
	docker-compose run web pytest /tests

black:
	@docker-compose run web black . && echo "🙆" || echo "🙅‍"

pyre:
	@docker-compose run web pyre --source-directory . check

mypy:
	@docker-compose run web mypy .

sure: black pyre mypy
