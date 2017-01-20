# Docker - Pootle translation server

## Start

As pootle consists of multiple components, we provide a `docker-compose.yml` to bring up and connect all the services.  
Use the following command to bring up the environment:

    docker-compose up -d

**Notice:** The mysql-server and the redis cache are not accessible by the outside world. Only the pootle container can access those services.

## First run

On the first run you must setup your database and create an admin user.

    docker-compose exec pootle bash
    source env/bin/activate
    pootle migrate
    pootle initdb
    pootle createsuperuser
    pootle verify_user --all


# TODO

- custom CSS (pootle 2.7) must be included in a template block as asset
- export translations according to TYPO3 convention https://git.typo3.org/Teams/Translation.git/blob/HEAD:/typo3/files/scripts/bin/build-language-pack
- Document https://docs.typo3.org/typo3cms/CoreApiReference/Internationalization/Translation/Index.html#custom-translation-servers
- Think of automatic refresh mechanism => partial extension files from git ?!
