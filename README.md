***
⚠️⚠️⚠️
> When Heroku became paywalled, we decided to decommission the site. You can still explore the code and see how it used to look below.

⚠️⚠️⚠️
***

# WePick

### [Makers Academy](http://www.makersacademy.com) - Final Project

[![Build Status](https://travis-ci.com/jasylwong/wepick.svg?branch=master)](https://travis-ci.com/jasylwong/wepick)
[![Maintainability](https://api.codeclimate.com/v1/badges/07d019d848df139b41d8/maintainability)](https://codeclimate.com/github/jasylwong/wepick/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/07d019d848df139b41d8/test_coverage)](https://codeclimate.com/github/jasylwong/wepick/test_coverage)
[![Heroku](https://pyheroku-badge.herokuapp.com/?app=wepick&style=flat)](https://wepick.herokuapp.com/)

Contributors: [Josh Blumberg](https://github.com/jlblumberg) | [Jason Wong](https://github.com/jasylwong) | [Ellie Jones](https://github.com/EllieRichardsonJones) | [Joe Ellingworth](https://github.com/blu3skies) | [Hansa Lallu](https://github.com/hansa-lallu)
__________________________________________________________________________________________________________________

[Outline](#Outline) | [Specifications](#Specifications) | [User stories](#User_stories) | [Accessing the app](#Accessing_the_app) | [Tech stack](#Tech_stack) | [Example use](#Example_use) | [Future work](#Future_work)

An app for helping users decide what films to watch together. [Click here](https://wepick.herokuapp.com) to see the app in action.

## <a name="Outline">Outline</a>

We worked in a team of five to build a project of our choice. The timeline was two weeks, with a feature-freeze midway through the second week, and a live demo day at the end.

## <a name="Specifications">Specifications</a>

Because this project took place during COVID-19, we decided to create a tool which would help friends facilitate social decision making while under isolation. This idea took form as an app that would help two people choose a film to watch.

## <a name="User_Stories">User stories</a>

User stories, which we derived from the above specification, can be found [here](https://docs.google.com/document/d/1uC696OFk2QUIaG8aY9efZn51uHeYW4GYahW4U2CWzag/edit?usp=sharing).

## <a name="Accessing_The_App">Accessing the app</a>

If you wish to visit the site as a user, please head to https://wepick.herokuapp.com. If you wish to contribute to this project, read on.

### Prerequisites:

Contributing requires that you have an API key for [TMDB](https://www.themoviedb.org/) and [Utelly](https://rapidapi.com/utelly/api/utelly). Please follow the links and generate a key for each. 

Once you have done that, create a .env file in the root, and add in each of the keys. It should look something like the below:
```
TMDB_KEY=long_string_of_characters
UTELLY_KEY=another_long_string_of_characters
```

### Initial setup:

- Clone this repo to your local machine and `cd` into it
- Run `gem install bundle` if you don't have bundler already
- Install homebrew if you don't have it already -- instructions [here](brew.sh)
- Run `brew install yarn` to install Yarn and Node
- Run `bundle` and `yarn install --check-files` to install the project's dependencies

### Database setup:

To set up the databases, run the following migration commands:

```
rails db:create
rails db:migrate
```

To populate the dabase with movie data, run the following command:

```
rails db:seed
```

### Running the site

Development:
- Run the server with command `rails server`
- Visit `localhost:3000` on your browswer to use the site

### Testing
- Tests can be run using RSpec. Run the command `rspec`.

## <a name="Tech_stack">Tech stack</a>

Front-end:
- HTML
- CSS (including Bootstrap)

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

You can see an example of the app in use below.

**Please note that due to Utelly rate limits, the Utelly API has been temporarily commented out in the source code. Users can still match as normal, but they won't be shown where they can stream the film. The GIF below is a demonstration of the app with both APIs included.**

![Imgur](https://i.imgur.com/8sRMy9E.gif)

## <a name="Future_work">Future work</a>

On a revisit of the project, we would like to add the following features:
- Dynamic and reactive styling device to device
- Swipe to like and dislike on mobile
- Links and logos for the resources within the where-to-watch feature
- An about page and instructions embedded in the UI
- Automated refresh of the films in the database
- Ability to search by username when adding friends
