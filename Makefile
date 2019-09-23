.PHONY: build up test

build: Dockerfile requirements.in
	rm -f .build-success
	docker-compose build web
	touch .build-success

up: .build-success
	docker-compose up -d

test: .build-success
	docker-compose run web pytest /tests

# shell: .build-success
# 	docker-compose run web /bin/bash

shell: .build-success
	docker run --rm -it \
		-p 5000:5000 \
		-v ${PWD}/src:/src \
		-v ${PWD}/test:/test \
		modern-py-api_web /bin/bash

black:
	@docker-compose run web black . && echo "🙆" || echo "🙅‍"

pyre:
	@docker-compose run web pyre --source-directory . check

mypy:
	@docker-compose run web mypy .

sure: black pyre mypy
