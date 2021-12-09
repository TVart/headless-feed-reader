install-api: Makefile
	git clone https://github.com/TVart/feed-reader-api.git api
	cd api && ./vendor/bin/sail up

install-app: api
	git clone https://github.com/TVart/feed-reader-app.git front
	cd front && npm run serve

test: tests
	$(PHP) php vendor/phpunit/phpunit/phpunit --configuration phpunit.xml