#= require vendor/require
#= require vendor/jquery
#= require vendor/underscore
#= require vendor/backbone
#= require views/main-view
#= require router

define "app",(require) ->
    $ = require("jquery");
    MainView = require("MainView")
    Router = require("Router")
    Backbone = require("Backbone")

    class  App
      showPage: (view) ->
        @view.showPage view

      init: ->
        @view = new MainView el: $("body")[0]
        @view.render()
        new Router app: @

        Backbone.history.start({pushState:false})

    return new App()
