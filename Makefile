APP_PATH = C:\Users\philo\Documents\headless-feed-reader
COMPOSER = docker run --rm --interactive --tty --volume ${APP_PATH}:/app -w /app composer:2
PHP = docker run --rm -it -v ./app:/app -w /app -u $$(id -u):$$(id -g) php:8



	$(COMPOSER) create-project laravel/laravel back-end

install-api: Makefile
	$(COMPOSER) composer update --prefer-lowest
	touch composer.lock

install-front: back-end
	$(COMPOSER) composer install
	touch vendor

test: tests
	$(PHP) php vendor/phpunit/phpunit/phpunit --configuration phpunit.xml