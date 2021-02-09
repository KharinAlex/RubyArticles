.PHONY: up stop shell-app shell-db clean-docker

up:
	docker-compose up -d && docker-compose run app bundle exec rake db:migrate RAILS_ENV=development && docker-compose logs -f app db

stop:
	docker-compose stop

shell-app:
	docker-compose run --rm app $(cmd)

shell-db:
	docker exec -ti db1 bash

clean-docker:
	docker system prune --all --volumes