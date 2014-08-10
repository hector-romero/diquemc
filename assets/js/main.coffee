#= require vendor/require
#= require vendor/jquery
#= require views/main-view

define "app",(require) ->
    $ = require("jquery");
    MainView = require("MainView")
    class  App
      init: ->
        @view = new MainView el: $("body")[0]
        @view.render()

    return new App()
