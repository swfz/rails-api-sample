# rails sample app

* Ruby version


* System dependencies
- redis
- mysql

* Configuration

* Database creation

* Database initialization

```
rake db:create
rails g db:migrate
```

## Develoment

### set environment

- docker/.env

for development environment. using docker and rails config

```
SAMPLE_DOCKER_REDIS_HOST=192.168.30.14
SAMPLE_DOCKER_REDIS_PORT=6379
SAMPLE_DOCKER_MYSQL_HOST=192.168.30.14
SAMPLE_DOCKER_MYSQL_PORT=3306
COMPOSE_PROJECT_NAME=sample
```

- docker

```
cd docker
sudo docker-compose up
```

- app(web)

```
envfile docker/.env bundle exec rails s
```

- app(resque)

```
envfile docker/.env ./bin/god start
```

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

capistrano



