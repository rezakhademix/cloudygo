
up:
	go run ./app/main.go

run:
	docker build -t webapp:v1 .
	docker run -p 9000:9000 webapp:v1

ps:
	docker ps

images:
	docker images | grep webapp