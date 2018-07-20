#!/bin/bash

# If you don't have surge installed, run from docker.
surge() {
  docker run -it --rm -v "$PWD:$PWD" -w "$PWD" amurf/surge surge $@
}

docker-compose run release
surge --domain sfv.surge.sh dist
