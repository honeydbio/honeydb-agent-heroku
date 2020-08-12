APP?=

all: build login push release logs

build:
	docker build -t honeydb-agent-heroku .

build-no-cache:
	docker build --no-cache -t honeydb-agent-heroku .

login:
	heroku container:login

push:
	heroku container:push web --app $(APP)

release:
	heroku container:release web --app $(APP)

open:
	heroku open --app $(APP)

logs:
	heroku logs --tail --app $(APP)

run:
	docker run -i -p 8080:8080 -t honeydb-agent-heroku /bin/bash
