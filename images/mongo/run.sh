#!/bin/bash
docker run -d \
  -e MONGO_INITDB_ROOT_USERNAME=admin \
  -e MONGO_INITDB_ROOT_USERNAME=skully \
  freesewing/mongo
