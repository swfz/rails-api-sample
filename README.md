# rails sample app

* Ruby version

2.3.1

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

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)
- resque

* Deployment instructions

* Development

- docker

```
cd docker
sudo docker-compose up
```

- app

```
rails s
QUEUE=* rake environment resque:work
```

