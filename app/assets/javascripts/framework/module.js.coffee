MovieClub.module = (name, body) ->
  externalDeps =
    jQuery: window.jQuery
    Underscore: window._
    Backbone: window.Backbone

  deps = [MovieClub, externalDeps]
  module = _.reduce(name.split("."), ((m, s) -> m[s] ?= {}; deps.unshift(m[s]); m[s]), MovieClub)
  body.apply(module, deps)

