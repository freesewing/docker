#!/bin/bash
docker build .  --build-arg http_proxy="http://136.173.162.155:8082" \
  --build-arg https_proxy="http://136.173.162.154:8082" \
  --build-arg no_proxy="ep.parl.union.eu" \
  --build -arg npm_registry="http://ep-foundry.ep.parl.union.eu/npm/repository/ep-registry/" \
  --tag freesewing/backend
