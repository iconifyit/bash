#!/usr/bin/env bash

function wpdocker {
    default_project="my-project"
    echo "Project name: (${default_project}):"
    read project

    project=$(thisorthat "$project" "$default_project")

    if [ -d "$project" ]
    then
      echo "A folder named $project already exists. Exiting script"
      return 1
    fi

    mkdir "$project"
    cd "$project"

    default_mysql_password="wordpress"
    echo "MySQL root password (password):"
    read mysql_password
    mysql_password=$(thisorthat "$mysql_password" "$default_mysql_password")

    default_wpdb_password="password"
    echo "WordPress DB password (password):"
    read wpdb_password
    mysql_password=$(thisorthat "$wpdb_password" "$default_wpdb_password")

    if [ -f "docker-compose.yml" ]
    then
      rm docker-compose.yml
    fi

    dockerfile="docker-compose.yml"
    rm_file_if_exists $dockerfile
    touch $dockerfile

    cat > "$dockerfile" <<EOL
version: "2"
services:
  my-wpdb:
    image: mariadb
    ports:
      - "8081:3306"
    environment:
      MYSQL_ROOT_PASSWORD: "$mysql_password"
  my-wp:
    image: wordpress
    volumes:
      - ./:/var/www/html
    ports:
      - "8080:80"
    links:
      - my-wpdb:mysql
    environment:
      WORDPRESS_DB_PASSWORD: "$wpdb_password"
  my-wpcli:
    image: tatemz/wp-cli
    volumes_from:
      - my-wp
    links:
      - my-wpdb:mysql
    entrypoint: wp
    command: "--info"
EOL

  if [ -f "$dockerfile" ]
  then
    docker-compose up -d
  else
    echo "Could not launch the Docker container because the docker compose file was not found"
  fi

}