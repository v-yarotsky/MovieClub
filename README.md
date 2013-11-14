Movie Club
==========

[![Build Status](https://secure.travis-ci.org/v-yarotsky/MovieClub.png)](http://travis-ci.org/v-yarotsky/MovieClub)
[![Code Climate](https://codeclimate.com/github/v-yarotsky/MovieClub.png)](https://codeclimate.com/github/v-yarotsky/MovieClub)

Features:
  * User:
    - [X] Login
    - [ ] Rate proposed events
    - [X] Propose an event
    - [ ] View past events
    - [ ] Comment an event
    - [X] View upcoming event
    - [ ] Say "I will attend the upcoming event"
    - [ ] Say "I won't be able to attend the upcoming event"

  * Admin:
    - [ ] Schedule next event from the list of top-rated proposed event
    - [ ] Gotta invite users by mail

Getting started
===============

    bundle install
    rake db:create db:migrate db:seed

Testing
=======

Prerequisites
-------------

Accepance tests depend on [PhantomJS](http://phantomjs.org).
Install with ``brew install phantomjs`` if you're on OS X.

Run ``RAILS_ENV=test rake db:create db:migrate``

Running
-------

    rake features


