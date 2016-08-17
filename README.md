# Docker - Pootle translation server

## First run

On the first run you must setup your database and create an admin user.

    docker-compose exec pootle bash
    source env/bin/activate
    pootle migrate
    pootle initdb
    pootle createsuperuser
    pootle verify_user --all
