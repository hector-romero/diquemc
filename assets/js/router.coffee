#= require views/pages-controller

define "Router",['require','Backbone','PagesController'], (require)->
  Backbone = require("Backbone")
  PagesController = require("PagesController")
  getQueryVariable = (variable) ->
    query = window.location.search.substring(1);
    vars = query.split("&");

    for param in vars
      pair = param.split("=")
      if(pair[0] == variable)
        return pair[1]
    return(false);


  class Router extends Backbone.Router
    routes:
      ':page'         : 'page'
      ''              : 'home'

    home: ->
      if page = getQueryVariable('page')
        @page page
      else
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