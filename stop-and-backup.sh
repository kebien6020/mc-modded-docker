#!/usr/bin/env sh

set -x

docker stop mc_mc_1

docker run --volumes-from=mc_mc_1 --rm debian \
	tar -czvf - /data/world | \
	aws s3 cp - s3://mc1-backups/world-$(date +%Y-%m-%d-%H-%M-%S-%Z).tar.gz

docker start mc_mc_1

