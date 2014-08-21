#= require views/templates/404

define "PagesController", ['require','jquery','Backbone'],(require) ->
  Backbone = require("Backbone")
  $ = require("jquery")

  class Page404 extends  Backbone.View

    render: ->
      @trigger 'errorLoading',  {message: "Section not found", code: 404}
      @$el.html JST["views/templates/404"]()
      @$el

  class Page extends Backbone.View

    load: ->
      @trigger 'startLoading'
      success =(data) =>
        @trigger 'finishLoading'
        @$el.html data
      error = =>
        console.log "error"
        @$el.html JST["views/templates/404"]()
        @trigger 'errorLoading',  {message: "Section not found", code: 404}

      $.ajax("assets/#{@section}.html").then success,error

    render: ->
      @$el.html ""
      @load()
      @$el

    initialize: (options)->
      @section = options.section

  return {

    getPage:(pageName) ->
      if /404/.test pageName
        return new Page404()
      unless  pageName
        pageName = "home"

      return new Page section: pageName
  }