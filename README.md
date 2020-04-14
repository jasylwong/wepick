### [Makers Academy](http://www.makersacademy.com) - Final Project

[![Build Status](https://travis-ci.com/jasylwong/wepick.svg?branch=master)](https://travis-ci.com/jasylwong/wepick)
[![Maintainability](https://api.codeclimate.com/v1/badges/4f0cfbe1fc185ef34e2c/maintainability)](https://codeclimate.com/github/jasylwong/wepick)
[![Test Coverage](https://api.codeclimate.com/v1/badges/4f0cfbe1fc185ef34e2c/test_coverage)](https://codeclimate.com/github/jasylwong/wepick)
[![Heroku](https://pyheroku-badge.herokuapp.com/?app=wepick&style=flat)](https://wepick.herokuapp.com/)

Contributors: [Josh Blumberg](https://github.com/jlblumberg) | [Jason Wong](https://github.com/jasylwong) | [Ellie Jones](https://github.com/EllieRichardsonJones) | [Joe Ellingworth](https://github.com/blu3skies) | [Hansa Lallu](https://github.com/hansa-lallu)
__________________________________________________________________________________________________________________

[Outline](#Outline) | [Specifications](#Specifications) | [User Stories](#User_Stories) | [Installation Instructions](#Installation_Instructions) | [Tech stack](#Tech_stack) | [Example use](#Example_use) | [Future work](#Future_work)

## <a name="Outline">Outline</a>

We worked in a team of five to build a project of our choice. The timeline was two weeks, with a feature-freeze midway through the second week, and a live demo day at the end.

## <a name="Specifications">Specifications</a>

Because this project took place during COVID-19, we decided to create a tool which would help friends facilitate social decision making while under isolation. This idea took form as an app that would help two people choose a film to watch.

## <a name="User_Stories">User Stories</a>

User stories, which we derived from the above specification, can be found [here](https://docs.google.com/document/d/1uC696OFk2QUIaG8aY9efZn51uHeYW4GYahW4U2CWzag/edit?usp=sharing).

## <a name="Installation_Instructions">Installation Instructions</a>

### Prerequisite setup:
- Clone this repo to your local machine and cd into it
- Run `gem install bundle` (if you don't have bundler already)
- Run `bundle` to install the project's dependencies

### Database setup:

To set up the databases, run the following migration commands:

```
rails db:create
rails db:migrate
```

To populate the dabase with movie data, run the following command:

```
bin/rails db:create
```

### Running the site

Development:
- Run the server with command `rails server`
- Visit `localhost:3000` on your browswer to use the site

Production:
- Visit https://wepick.herokuapp.com/

### Testing
- Tests can be run using Rspec. Run the command `rspec`.

## <a name="Tech_stack">Tech stack</a>

Front-end:
- HTML & CSS

Back-end:
- Ruby
- Ruby On Rails
- PostgreSQL
- The Movie Database (TMDB) API for movie fetch and details [(about TMDB)](https://www.themoviedb.org/)
- Utelly for information about where to watch [(about Utelly)](https://rapidapi.com/utelly/api/utelly)

Testing:
- RSpec
- SimpleCov
- Code Climate
- Travis CI

Hosting:
- Heroku

## <a name="Example_use">Example use</a>

You can see an example of the app in use here:

![Imgur](https://i.imgur.com/FiQy2qY.gifv)

## <a name="Future_work">Future work</a>

On a revisit of the project, we would like to add the following features:
- Dynamic and reactive styling device to device
- Swipe to like and dislike on mobile
- Links and logos for the resources within the where-to-watch feature
- An about page and instructions embedded in the UI
- Automated refresh of the films in the database
