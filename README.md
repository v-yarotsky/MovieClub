Movie Club
==========

Features:
  * User:
    - Login
    - Rate proposed events
    - Propose an event
    - View past events
    - Comment an event
    - View upcoming event
    - Say "I will attend the upcoming event"
    - Say "I won't be able to attend the upcoming event"

  * Admin:
    - Schedule next event from the list of top-rated proposed event

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


