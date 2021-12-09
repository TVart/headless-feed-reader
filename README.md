# headless-feed-reader

## Pre-requisite
Need running ``Docker`` for desktop

``make`` tool if not installed can be installed by ``sudo apt install make``

## Back-end

Init new laravel project with laravel sail:

``curl -s https://laravel.build/api | bash``

It will bring us an easy way to start and deploy the app

### Build & Run in local env

Laravel sail let us to run our app quickly by running the command : 
``./vendor/bin/sail up``

So Makefile contains 2 commands :

``make install-api`` : clone project and run the app

``make run-api`` : run the app when project is already cloned

### Development Steps

#### Controller

1 - As we don't mind to store anything, let's create a model & controller
without migration nor seeder / factory
``./vendor/bin/sail artisan make:model Article -c``

2 - To be able to wrap articles from different sources we design 2 API routes
to fetch articles by targeting a source : 
```http://host.com/articles?source=target```
and an other one to target a single article by his id : 
```http://host.com/articles/{id}?source=target```

We define 2 methods in the Controller ArticleController

``index``
to display all articles from a source

``show``
to display a single article from a source

we override ``validate`` method to check that the source exists, otherwise we throw an exception

``error`` method is designed to factorise Error messages (source not found)


#### Services

For the app purpose we have 3 files in our Services

1 - Our ApiWrapperFactory which will instantiate a real API
according the source passed in the parameter.

2 - Api Interface exposing method ``getAll`` and ``getOne`` to retrieve
data from wrapped API

3 - LemondeApi, our first API source based on rss feed from lemonde.fr

## Front-end

Install vue globally : 
``npm install -g @vue/cli @vue/cli-service-global``

Init new project
``vue create`front-end`