start: index.js package.json
	node index.js

build:
	docker-compose up -d --build

run:
	docker-compose up -d

destroy:
	docker-compose down