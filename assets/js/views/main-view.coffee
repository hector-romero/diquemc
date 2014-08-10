#= require views/templates/main
#= require views/templates/header

define "MainView", ['require','Backbone'],(require) ->
    Backbone = require("Backbone")

    class  Header extends Backbone.View
      setActive:(section) ->
        @$(".selected").removeClass("selected")
        @$(".#{section}").addClass("selected")

      render: ->
        @$el.html JST["views/templates/header"]()
        @$el

    class MainView extends Backbone.View

      showSpinner: ->
        @$(".spinner").fadeIn("fast")

      hideSpinner: ->
        @$(".spinner").fadeOut("slow")

      removeCurrentView: ->
        return unless @current
        @current.remove()
        @stopListening(@current)
        @current = null

      setCurrentView:(view) ->
        @removeCurrentView()
        @current = view
        @listenTo @current, 'startLoading', => @showSpinner()
        @listenTo @current, 'finishLoading', => @hideSpinner()
        @listenTo @current, 'errorLoading',(e = "Error") =>
          @hideSpinner()
#          console.log "error e"
#          alert e.message || e

      showPage: (view) ->
        @setCurrentView(view)
        @header.setActive @current.section
        @current.render()
        @$content.html @current.$el

      render: ->
        @header = new Header el: @$(".header-container")[0]
        @header.render()

        @$(".container").html JST["views/templates/main"]()
        @$content= @$(".content")
        @$el

    return MainView