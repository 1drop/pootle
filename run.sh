#!/bin/bash

source env/bin/activate

pootle rqworker &
pootle run_cherrypy --host 0.0.0.0 --port 8000