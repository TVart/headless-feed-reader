install-api: Makefile
	git clone https://github.com/TVart/feed-reader-api.git api
	run-api

install-app: api
	git clone https://github.com/TVart/feed-reader-app.git front
	run-app

run-api: api
	cd api && ./vendor/bin/sail up

run-app: front
	cd front && npm i &&  ionic serve