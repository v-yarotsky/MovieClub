class MovieClub.CompositeView extends MovieClub.BaseView
  renderSubview: (subview, selector) ->
    subview.setElement(this.$(selector)).render()

  registerSubview: (subview) ->
    @_subviews ?= []
    @_subviews.push(subview)

  removeSubviews: ->
    if @_subviews?
      subview.leave() for subview in @_subviews


