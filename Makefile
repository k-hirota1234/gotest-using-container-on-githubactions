build:
	docker-compose build

up:
	if [ -z "`docker network ls | grep gotest-using-container-on-githubactions`" ]; then docker network create gotest-using-container-on-githubactions; fi
	docker-compose up -d --remove-orphans

down:
	docker-compose down

restart:
	docker-compose restart golang && docker-compose ps

logs:
	docker-compose logs --tail=10 -f golang

test:
	docker-compose exec golang go test -cover ./...
