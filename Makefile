init-front:
	vue create front

install-back: Makefile
	git clone https://github.com/TVart/feed-reader-api.git api
	cd api && ./vendor/bin/sail up

install-front: back-end
	git clone https://github.com/TVart/feed-reader-app.git front

test: tests
	$(PHP) php vendor/phpunit/phpunit/phpunit --configuration phpunit.xml