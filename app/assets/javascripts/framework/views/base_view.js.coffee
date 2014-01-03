MovieClub.module "Views", (Views, MovieClub, d)->
  class @BaseView extends d.Backbone.View
    leave: ->
      @remove()

    log: (msg) ->
      if MovieClub.renderLoggingEnabled
        console.log("rendering", msg, @cid)
