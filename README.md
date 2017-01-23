# Docker - Pootle translation server

## Start

As pootle consists of multiple components, we provide a `docker-compose.yml` to bring up and connect all the services.  
Use the following command to bring up the environment:

    docker-compose up -d

**Notice:** The mysql-server and the redis cache are not accessible by the outside world. Only the pootle container can access those services.

## First run

On the first run you must setup your database and create an admin user.

    docker-compose exec pootle bash
    pootle migrate
    pootle initdb
    pootle createsuperuser
    pootle verify_user --all


## Feeding pootle

### Create project in pootle

First you must create a project in the pootle administration backend. Only super-users can access the backend.
By naming convention, your project in pootle must be named `TYPO3.ext.myextname` if your extension name is `myextname`.  
As file-type choose `XLIFF (.xlf)` and leave the other settings default.

### Uploading an extension to pootle

All extensions must be placed under `/srv/pootle/git-clones/repos` in order to be imported and maintained by the pootle server.
In order to get the files there you can either add a SFTP container that has access to a specific repo folder e.g.

    sftp:
        image: atmoz/sftp
        volumes:
            - /host/share:/home/foo/share
        ports:
            - "2222:22"
        command: foo:123:1001    

Or you place a shell script that automatically updates the project in `/srv/pootle/git-clones/scripts/myextname.sh` that can 
do e.g. git clone, download, or whatever to get the files to the `repos/myextname` folder.

# TODO

- custom CSS (pootle 2.7) must be included in a template block as asset
- export translations according to TYPO3 convention https://git.typo3.org/Teams/Translation.git/blob/HEAD:/typo3/files/scripts/bin/build-language-pack
- Document https://docs.typo3.org/typo3cms/CoreApiReference/Internationalization/Translation/Index.html#custom-translation-servers
- Think of automatic refresh mechanism => partial extension files from git ?!
