#!/bin/bash

source .env

cd build && docker-compose run --rm builder
