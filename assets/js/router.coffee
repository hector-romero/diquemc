#= require views/pages-controller

define "Router", (require)->
  Backbone = require("Backbone")
  PagesController = require("PagesController")

  class Router extends Backbone.Router
    routes:
      ':page'     : 'page'
      ''          : 'home'

    home: ->
      @page 'home'

    page: (pageName)->
      page = PagesController.getPage(pageName)
      return unless page
      @showPage(page)

    showPage: (view) ->
      window.viewActive = view
      @app.showPage view, Backbone.history.fragment

    initialize:(options) ->
      unless  options.app
        throw  "App not specified"
      @app = options.app


  return Router