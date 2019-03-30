all: build push release logs

build:
	docker build -t honeydb-heroku .

build-no-cache:
	docker build --no-cache -t honeydb-heroku .

push:
	heroku container:push web --app fast-springs-51709

release:
	heroku container:release web --app fast-springs-51709

open:
	heroku open --app fast-springs-51709

logs:
	heroku logs --tail --app fast-springs-51709

run:
	docker run -i -t honeydb-heroku /bin/bash
