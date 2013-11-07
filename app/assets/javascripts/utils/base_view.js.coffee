class MovieClub.BaseView extends Backbone.View
  leave: ->
    @remove()

  log: (msg) ->
    if MovieClub.renderLoggingEnabled
      console.log("rendering", msg, @cid)
