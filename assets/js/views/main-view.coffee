#= require vendor/underscore
#= require vendor/jquery
#= require vendor/backbone

#= require views/templates/main

define "MainView", (require) ->
    backbone = require("backbone")
    class MainView extends backbone.View
      render: ->
        @$el.html JST["views/templates/main"]()

    return MainView