MovieClub.module "Views", (Views, MovieClub) ->
  class @Logout extends @BaseView
    events:
      'click .js-logout': 'logout'

    initialize: ->
      @log("create logout view")
      @listenToOnce MovieClub, "logout", @remove

    render: ->
      @log("render logout link")
      @$el.html("<a class='js-logout' href='#logout'>Sign Out</a>")
      @delegateEvents()
      @

    logout: (e) ->
      @log("click logout")
      e.preventDefault()
      MovieClub.session().destroy()
