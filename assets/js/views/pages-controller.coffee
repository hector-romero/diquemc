define "PagesController", (require) ->
  Backbone = require("Backbone")
  $ = require("jquery")
  class Page extends Backbone.View

    load: ->
      @trigger 'startLoading'
      success =(data) =>
        @trigger 'finishLoading'
        @$el.html data
      error = =>
        console.log "error"
        @$el.html "404: Not Found"
        @trigger 'errorLoading',  {message: "Section not found", code: 404}

      $.ajax("assets/#{@section}.html").then success,error

    render: ->
      @$el.html "Loading: #{@section}"
      @load()
      @$el

    initialize: (options)->
      @section = options.section

  return {

    getPage:(pageName) ->
      unless  pageName
        pageName = "home"
      return new Page section: pageName
  }