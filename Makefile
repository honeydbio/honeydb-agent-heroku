APP?=

all: build push release logs

build:
	docker build -t honeydb-agent-heroku .

build-no-cache:
	docker build --no-cache -t honeydb-agent-heroku .

push:
	heroku container:push web --app $(APP)

release:
	heroku container:release web --app $(APP)

open:
	heroku open --app $(APP)

logs:
	heroku logs --tail --app $(APP)

run:
	docker run -i -t honeydb-agent-heroku /bin/bash
