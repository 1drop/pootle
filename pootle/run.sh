#!/bin/bash

pootle rqworker &
pootle runfcgi host=0.0.0.0 port=8080 daemonize=false
