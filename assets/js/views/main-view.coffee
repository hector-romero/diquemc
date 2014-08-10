#= require views/templates/main
#= require views/templates/header

define "MainView", (require) ->
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
        console.log "Showing spinner"

      hideSpinner: ->
        console.log "Hiding spinner"

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
        @listenTo @current, 'errorLoading',(e) =>
          @hideSpinner()
          alert "Invalid page"

      showPage: (view) ->
        @removeCurrentView()
        @current = view
        @header.setActive view.section
        view.render()
        @$content.html view.$el

      render: ->
        @header = new Header el: @$(".header-container")[0]
        @header.render()

        @$(".container").html JST["views/templates/main"]()
        @$content= @$(".content")
        @$el

    return MainView