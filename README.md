# Sample implementation of running a rails app + db in docker

## Initialize rails app
    docker-compose run web rails new . --force --database=mysql --skip-bundle

## Configure database
    sed -i.bak s/localhost/db/g config/database.yml

## Edit Gemfile and update any required gems
    vi Gemfile

## Install the bundle in a reusable docker image
    docker-compose build

## Create database schema
    docker-compose run web rake db:create

## Run application
    docker-compose up -d
