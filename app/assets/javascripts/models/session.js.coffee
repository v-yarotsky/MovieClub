MovieClub.module "Models", (Models, MovieClub, d) ->
  class @Session
    url: MovieClub.routes.api_session_path

    reset: (sessionAttributes) ->
      @log("reset")
      sessionAttributes = if sessionAttributes then _.clone(sessionAttributes) else {}
      @email = sessionAttributes.email || ""
      @password = sessionAttributes.password || ""

    create: (sessionAttributes) ->
      @log("create")
      @reset(sessionAttributes)
      @_ajaxRequest "POST",
        data: JSON.stringify(@toJSON()),
        success: (response) =>
          @log("login success", response)
          MovieClub.trigger("login", authenticityToken: response.authenticity_token)
        error: (response) =>
          @log("login failure", response)
          MovieClub.trigger("login:failure", response.responseJSON)
        complete: =>
          @reset(email: sessionAttributes.email)

    destroy: ->
      @log("destroy")
      @_ajaxRequest "DELETE",
        success: (xhr, statusText, response) =>
          @log("logout success")
          @reset()
          MovieClub.trigger("logout", authenticityToken: response.responseJSON.authenticity_token)
        error: =>
          @log("logout failure")
          MovieClub.trigger("logout:failure")

    _ajaxRequest: (method, options) ->
      options = _.clone(options)
      _.extend options,
        type: method,
        contentType: "application/json",
      d.Backbone.ajax(_.result(@, "url"), options)

    isAuthenticated: ->
      @email? && @email != ""

    toJSON: ->
      remember_me: false,
      email: @email
      password: @password

    log: (msg) ->
      if MovieClub.sessionLoggingEnabled
        console.log("session", msg)
