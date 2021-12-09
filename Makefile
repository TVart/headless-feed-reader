APP_PATH = C:\Users\philo\Documents\headless-feed-reader
COMPOSER = docker run --rm --interactive --tty -w $(APP_PATH) composer:2
PHP = sail

init-back:


init-front:
	vue create front-end

install-back: Makefile
	git clone git@github.com:TVart/headless-feed-reader-api.git api
	cd api && ./vendor/bin/sail up

install-front: back-end
	$(COMPOSER) composer install
	touch vendor

test: tests
	$(PHP) php vendor/phpunit/phpunit/phpunit --configuration phpunit.xml